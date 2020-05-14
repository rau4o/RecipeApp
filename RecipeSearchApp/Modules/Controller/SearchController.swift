//
//  SearchController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/7/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Kingfisher

private let cellId = "cellId"
private let cellHeight: CGFloat = 150

class SearchController: UIViewController {
    
    // MARK: - Views
    
    fileprivate lazy var searchController = UISearchController(searchResultsController: nil)
    fileprivate lazy var tableView = UITableView()
    var viewModel = SearchViewModel()
    var activityIndicatorView = UIActivityIndicatorView()
    let detailController = DetailController()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        clearSelectionForCell()
        navigationController?.navigationBar.isHidden = false
        super.viewDidAppear(animated)
    }
}

extension SearchController: SearchProtocol {
    func updateTableView() {
        tableView.reloadData()
    }
    
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    func finishLoading() {
        activityIndicatorView.stopAnimating()
    }
}

extension SearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {return}
        activityIndicatorView.startAnimating()
        viewModel.searchRecipe(with: query) { [weak self] in
            guard let self = self else {return}
            self.tableView.dataSource = self.viewModel.dataSource
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.deleteLoadedRecipe()
        tableView.reloadData()
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = viewModel.getElements(at: indexPath.row)
        navigationController?.pushViewController(detailController, animated: true)
        detailController.detailView.configureUI(recipe: recipe)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

private extension SearchController {
    
    func initialSetup() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupNavigationBar()
        setupViews()
        setupTableView()
        setupSearchController()
    }
    
    private func configureIndicatorView() {
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.style = .large
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        title = "Search"
    }
    
    func setupTableView() {
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = viewModel.dataSource
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tableView.separatorStyle = .none
        tableView.backgroundView = activityIndicatorView
    }
    
    func setupSearchController() {
       searchController.obscuresBackgroundDuringPresentation = false
       searchController.hidesNavigationBarDuringPresentation = false
       searchController.searchBar.placeholder = "Search"
       searchController.searchBar.delegate = self
    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicatorView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        activityIndicatorView.centerY(inView: view)
        activityIndicatorView.centerX(inView: view)
        activityIndicatorView.setDimension(height: 100, width: 100)
        activityIndicatorView.style = UIActivityIndicatorView.Style.medium
    }
    
    func clearSelectionForCell() {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }
}
