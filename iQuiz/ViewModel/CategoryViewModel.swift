//
//  CategoryViewModel.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 29/11/25.
//

import Foundation

class CategoryViewModel {
    
    private let service = CategoryService()
    var categorySelected: Int = 0
    
    @MainActor
    var onUpdate: (() -> Void)?
    
    private(set) var categories: [Category] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    func loadCategories() {
        Task {
            do {
                let result = try await service.fetchData()
                switch result {
                case .success(let list):
                    self.categories = list
                case .failure(let error):
                    print("Erro ao carregar categorias: \(error)")
                }
            } catch {
                print("Erro inesperado: \(error)")
            }
        }
    }
    
    func setCategorySelected(_ category: Int) {
        self.categorySelected = category
    }
}
