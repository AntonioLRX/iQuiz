//
//  QuestionViewModel.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 04/12/25.
//

import Foundation

enum QuestionState {
    case loading        // A requisição está em andamento (mostra o spinner)
    case success([Question]) // Dados carregados com sucesso
    case error(String)  // Ocorreu um erro (mostra a mensagem de erro)
    case initial        // (Opcional) Estado inicial antes da primeira carga
}

class QuestionViewModel {
    
    private let questionService = QuestionService()
    
    @MainActor
    var onUpdate: (() -> Void)?
    
    private(set) var state: QuestionState = .initial {
        didSet {
            onUpdate?()
        }
    }
    
    func loadQuestions(
        categoryId: Int = 9,
        difficult: DifficultEnum = .EASY
    ) {
        self.state = .loading
        Task {
            do {
                let result = try await questionService.getQuestions(
                    categoryId: categoryId,
                    difficult: difficult
                )
                switch result {
                case .success(let list):
                    self.state = .success(list)
                case .failure(let error):
                    print("Erro ao carregar categorias: \(error)")
                }
            } catch {
                print("Erro inesperado: \(error)")
            }
        }
    }
}
