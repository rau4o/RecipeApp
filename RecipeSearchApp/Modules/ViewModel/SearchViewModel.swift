//
//  SearchViewModel.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

protocol SearchProtocol: class{
    func updateTableView()
    func startLoading()
    func finishLoading()
}

class SearchViewModel {
    
    var recipesData: [Recipe] = []
    weak var delegate: SearchProtocol?
    var dataSource: TableViewDataSource<Recipe, SearchCell>?
    
    func searchRecipe(with query: String,completion: @escaping () -> Void) {
        delegate?.startLoading()
        NetworkService.shared.fetchRecipe(with: query) { [weak self] (recipe, error) in
            guard let self = self else {return}
            if let error = error {
                print(error.localizedDescription)
            }
            if let recipe = recipe?.hits {
                for i in 0..<recipe.count {
                    self.recipesData.append(recipe[i].recipe)
                }
            }
            self.recipeDidLoad(self.recipesData)
            self.delegate?.finishLoading()
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func deleteLoadedRecipe() {
        self.recipesData.removeAll()
        dataSource = .make(for: recipesData, reuseIdentifier: "cellId")
    }
    
    private func recipeDidLoad(_ recipe: [Recipe]) {
        dataSource = .make(for: recipe, reuseIdentifier: "cellId")
    }
    
    func numberOfElements() -> Int {
        return recipesData.count
    }
    
    func getElements(at index: Int) -> Recipe {
        return recipesData[index]
    }
}
