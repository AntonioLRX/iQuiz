//
//  CategoriesTableViewCell.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 29/11/25.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryButton: UIButton!
    var categorySelected: String = ""
    var buttonSenderSelected: UIButton? = nil
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        categorySelected = sender.titleLabel?.text ?? ""
    }
    func configCategory(category: Category) {
        categoryButton.setTitle(category.name, for: .normal)
    }
}
