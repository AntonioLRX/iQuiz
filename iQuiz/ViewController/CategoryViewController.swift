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
    @IBOutlet weak var contentButtonView: UIView!
    private let viewModel = CategoryViewModel()
    
    @IBAction func advanceButton(_ sender: UIButton) {
        navigateToQuestionScreen(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configLayout()
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
    
    func configLayout() {
        contentButtonView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentButtonView.layer.cornerRadius = 24
        contentButtonView.layoutMargins = .zero
    }
    
    func navigateToQuestionScreen(_ sender: Any) {
        performSegue(withIdentifier: "goToQuestionScreen", sender: sender)
    }
    
    //segue é uma transicao entre telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let questionVC = segue.destination as? QuestionViewController else { return }
        questionVC.categoryId = viewModel.categorySelected
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
        
        categoryCell.onButtonPressed = { [weak self] category in
                self?.viewModel.categorySelected = category
            }
    
        return categoryCell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
