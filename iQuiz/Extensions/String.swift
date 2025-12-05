//
//  String.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 04/12/25.
//

import UIKit

extension String {
    // Função para decodificar entidades HTML (como &quot;, &#039;, &amp;)
    var decodedHTMLEntities: String {
        guard let data = self.data(using: .utf8) else {
            return self
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return self
        }
        
        return attributedString.string
    }
}
