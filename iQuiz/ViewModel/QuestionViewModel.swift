//
//  QuestionViewModel.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 04/12/25.
//

import Foundation

class QuestionViewModel {
    
    private let questionService = QuestionService()
    
    @MainActor
    var onUpdate: (() -> Void)?
    
    private(set) var questions: [Question] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    func loadQuestions() {
        Task {
            do {
                let result = try await questionService.getQuestions(
                    categoryId: 9,
                    difficult: DifficultEnum.EASY
                )
                switch result {
                case .success(let list):
                    self.questions = list
                case .failure(let error):
                    print("Erro ao carregar categorias: \(error)")
                }
            } catch {
                print("Erro inesperado: \(error)")
            }
        }
    }
}
