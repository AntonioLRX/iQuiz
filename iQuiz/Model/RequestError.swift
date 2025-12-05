//
//  RequestError.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 04/12/25.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}
