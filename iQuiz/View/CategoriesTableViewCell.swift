//
//  CategoriesTableViewCell.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 29/11/25.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryButton: UIButton!
    
    func configCategory(category: Category) {
        categoryButton.setTitle(category.name, for: .normal)
    }
}
