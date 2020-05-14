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
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layoutUI()
        fetchFood()
        configureIndicatorView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        indicatorView.startAnimating()
    }
    
    // MARK: - Helper function
    
    private func fetchFood() {
        indicatorView.startAnimating()
        viewModel.searchRecipe(with: "search") { [weak self] in
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
        view.addSubview(tableView)
        view.addSubview(indicatorView)
        
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0)
        indicatorView.centerX(inView: view)
        indicatorView.centerY(inView: view)
        indicatorView.setDimension(height: 100, width: 100)
    }
}

// MARK: - UITableViewDelegate

extension MenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("pressed")
    }
}

// MARK: - UITableViewDataSource

extension MenuController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "LASTEST"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
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

