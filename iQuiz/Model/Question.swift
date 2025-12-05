//
//  Untitled.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 30/10/25.
//

import Foundation

struct QuestionResponse: Decodable {
    let response_code: Int
    let results: [Question]
}

struct Question: Decodable {
    var title: String
    var incorrectAnswers: [String]
    var correctAnswer: String
    
    // NOVO: Inicializador para decodificar HTML
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decodifica e aplica a limpeza HTML imediatamente
        let rawTitle = try container.decode(String.self, forKey: .title)
        self.title = rawTitle.decodedHTMLEntities
        
        let rawCorrectAnswer = try container.decode(String.self, forKey: .correctAnswer)
        self.correctAnswer = rawCorrectAnswer.decodedHTMLEntities
        
        let rawIncorrectAnswers = try container.decode([String].self, forKey: .incorrectAnswers)
        self.incorrectAnswers = rawIncorrectAnswers.map { $0.decodedHTMLEntities }
    }
    
    enum CodingKeys: String, CodingKey {
        case correctAnswer = "correct_answer"
        case title = "question"
        case incorrectAnswers = "incorrect_answers"
    }
    
    var allAnswers: [String] {
        let combinedAnswers = incorrectAnswers + [correctAnswer]
        let uniqueAnswersSet = Set(combinedAnswers)
        print("Combined Answers antes do Set: \(combinedAnswers)")
        return Array(uniqueAnswersSet).shuffled()
    }
}
