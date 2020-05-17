//
//  IngredientController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/17/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

protocol PassData: class {
    func pass(recipe: Recipe)
}

extension IngredientController: PassData {
    func pass(recipe: Recipe) {
        ingredientTextView.text = recipe.ingredientLines.map({"● \($0)"}).joined(separator: "\n")
    }
}

class IngredientController: UIViewController {
    
    // MARK: - Properties
    let menuVC = MenuController()
    
    let ingredientTextView: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 20, weight: .medium))
        text.sizeToFit()
        text.textColor = .black
        return text
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        menuVC.delegate = self
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        view.addSubview(ingredientTextView)
        
        ingredientTextView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configureTextView(recipe: Recipe) {
        ingredientTextView.text = recipe.ingredientLines.map({"● \($0)"}).joined(separator: "\n")
    }
}
