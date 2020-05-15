//
//  MenuController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let heightCell: CGFloat = 250
private let headerHeight: CGFloat = 30

class MenuController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel = SearchViewModel()
    
    lazy var indicatorView = UIActivityIndicatorView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainCollectionCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
        fetchFood()
        configureIndicatorView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Helper function
    
    private func fetchFood() {
        indicatorView.startAnimating()
        viewModel.searchRecipe(with: "hello") { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
            self.indicatorView.stopAnimating()
        }
    }
    
    private func configureIndicatorView() {
        indicatorView.hidesWhenStopped = true
        indicatorView.style = .large
    }
    
    private func layoutUI() {
        view.addSubviews([tableView, indicatorView])
        
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0)
        indicatorView.centerX(inView: view)
        indicatorView.centerY(inView: view)
        indicatorView.setDimension(height: 100, width: 100)
    }
}

// MARK: - UITableViewDelegate

extension MenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = viewModel.getElements(at: indexPath.row)
        navigationController?.pushViewController(DetailController.shared, animated: true)
        DetailController.shared.detailView.configureUI(recipe: recipe)
        DetailController.shared.additionalLabel.text = recipe.ingredientLines.map({ ("● \($0)")}).joined(separator: "\n")
    }
}

// MARK: - UITableViewDataSource

extension MenuController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel(text: "LASTEST", font: .systemFont(ofSize: 20, weight: .medium), textColor: .black)
        view.addSubview(label)
        label.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 100)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfElements()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueCell(withIdentifier: cellId, for: indexPath) as? MainCollectionCell {
            let recipe = viewModel.getElements(at: indexPath.row)
            cell.selectionStyle = .none
            cell.configureCell(recipe: recipe)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCell
    }
}

