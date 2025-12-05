//
//  HomeService.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 28/11/25.
//

import Foundation

struct CategoryService {
    func fetchData() async throws -> Result<[Category], RequestError> {
        guard let url = URL(string: "https://opentdb.com/api_category.php") else { return .failure(.invalidURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let categoriesObjects = try JSONDecoder().decode(CategoryResponse.self, from: data)
        
        return .success(categoriesObjects.trivia_categories)
    }
    
    
    func fetchDataMock() async throws -> Result<[Category], RequestError> {
        return .success(categoriesMock)
    }
}

