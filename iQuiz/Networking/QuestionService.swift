//
//  QuestionService.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 04/12/25.
//

import Foundation


struct QuestionService{
    
    func getQuestions(
        amount: Int = 10,
        categoryId: Int,
        difficult: DifficultEnum,
    ) async throws -> Result<[Question], RequestError> {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&category=\(categoryId)&difficulty=\(difficult.rawValue)&type=multiple") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let questionObjects = try JSONDecoder().decode(QuestionResponse.self, from: data)
        
        print(questionObjects.results)
        return .success(questionObjects.results)
    }
    
}
