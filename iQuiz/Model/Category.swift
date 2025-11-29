//
//  Untitled.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 28/11/25.
//

import Foundation

struct CategoryResponse: Decodable {
    let trivia_categories: [Category]
}

struct Category: Identifiable, Decodable {
    var id: Int
    var name: String
}
