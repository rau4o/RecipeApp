//
//  TableViewDataSource.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueCell<Cell: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
    }
}


final class TableViewDataSource<Model,Cell: UITableViewCell>: NSObject, UITableViewDataSource {

    typealias CellConfigurator = (Model,Cell) -> Void

    var models: [Model]

    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator

    init(models: [Model], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.selectionStyle = .none
        cellConfigurator(model,cell)
        return cell
    }
}

extension TableViewDataSource where Model == Recipe {
    static func make(for recipe: [Recipe], reuseIdentifier: String) -> TableViewDataSource {
        return TableViewDataSource(models: recipe, reuseIdentifier: reuseIdentifier) { (recipe, cell) in
            if let cell = cell as? SearchCell {
                cell.configureCell(recipe: recipe)
            }
        }
    }
}


