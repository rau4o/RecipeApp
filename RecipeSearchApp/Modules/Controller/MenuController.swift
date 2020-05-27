//
//  MenuController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

private let cellId = "cellId"
private let headerCellId = "headerCellId"
private let heightCell: CGFloat = 180
private let headerHeight: CGFloat = 250
private let space: CGFloat = 10

class MenuController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel = SearchViewModel()
    lazy var indicatorView = UIActivityIndicatorView()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MainCollectionCell.self, forCellReuseIdentifier: cellId)
        tableView.register(HeaderCell.self, forHeaderFooterViewReuseIdentifier: headerCellId)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.lightBlue
        return tableView
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        fetchFood()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.layer.zPosition = 0
    }
    
    // MARK: - Helper function
    
    private func fetchFood() {
        indicatorView.startAnimating()
        viewModel.searchRecipe(with: "popular") { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
            self.indicatorView.stopAnimating()
        }
    }
}

// MARK: - UITableViewDelegate

extension MenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = viewModel.getElements(at: indexPath.row)
        navigationController?.pushViewController(DetailController.shared, animated: true)
        DetailController.shared.detailView.configureUI(recipe: recipe)
        DetailController.shared.detailView.recipe = recipe
    }
}

// MARK: - UITableViewDataSource

extension MenuController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerCellId) as? HeaderCell
        return view
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.lightBlue
//        let label = UILabel(text: "LASTEST", font: .systemFont(ofSize: 20, weight: .medium), textColor: .white)
//        view.addSubview(label)
//        label.snp.makeConstraints { (make) in
//            make.top.left.equalTo(view).inset(5)
//            make.bottom.equalTo(view)
//            make.width.equalTo(100)
//        }
//        return view
//    }
    
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

// MARK: - Setup Views

private extension MenuController {
    
    func initialSetup() {
        view.backgroundColor = UIColor.lightBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        layoutUI()
        configureIndicatorView()
        setupNavBar()
    }
    
    private func setupNavBar() {
        title = "Delicious"
        
        navigationController?.navigationBar.barTintColor = UIColor.darkBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func layoutUI() {
        view.addSubviews([tableView, indicatorView])
        
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0)
        indicatorView.centerX(inView: view)
        indicatorView.centerY(inView: view)
        indicatorView.setDimension(height: 100, width: 100)
    }
    
    private func configureIndicatorView() {
        indicatorView.hidesWhenStopped = true
        indicatorView.style = .large
    }
}

