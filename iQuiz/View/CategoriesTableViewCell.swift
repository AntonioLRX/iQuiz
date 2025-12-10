//
//  CategoriesTableViewCell.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 29/11/25.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryButton: UIButton!
    var categorySelected: Int = 0
    var onButtonPressed: (Int) -> Void = {_ in }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        onButtonPressed(sender.tag)
    }
    func configCategory(category: Category) {
        categoryButton.setTitle(category.name, for: .normal)
        categoryButton.tag = category.id
    }
}
