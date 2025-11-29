//
//  CategoryViewController.swift
//  iQuiz
//
//  Created by Antonio Lucas Reginaldo Xavier on 28/11/25.
//

import UIKit

let IDENTIFIER = "CategoriesTableViewCell"

class CategoryViewController: UIViewController {
    

    @IBOutlet weak var categoriesTableView: UITableView!
    
    private let viewModel = CategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        bindViewModel()
        viewModel.loadCategories()
    }
    
    func bindViewModel() {
        viewModel.onUpdate = { [weak self] in
            self?.categoriesTableView.reloadData()
        }
    }
    
    func configTableView() {
        navigationItem.hidesBackButton = true
        categoriesTableView.register(
            UINib(nibName: IDENTIFIER, bundle: nil),
            forCellReuseIdentifier: IDENTIFIER
        )
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        categoriesTableView.separatorInset = .zero
        categoriesTableView.layoutMargins = .zero
        categoriesTableView.sectionHeaderTopPadding = 0
    }
}

extension CategoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryCell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER) as? CategoriesTableViewCell else {
            fatalError("Error to create table view cell")
        }
        
        let category = viewModel.categories[indexPath.row]
        categoryCell.configCategory(category: category)
    
        return categoryCell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
