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

class IngredientController: UIViewController {
//    func pass(recipe: Recipe) {
//        iView.ingredientTextView.text = recipe.ingredientLines.map({"● \($0)"}).joined(separator: "\n")
//    }
    
    
    // MARK: - Properties
    
    let iView = IngredientView()
    
//    let ingredientTextView: UITextView = {
//        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 20, weight: .medium))
//        text.sizeToFit()
//        text.textColor = .black
//        return text
//    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        view.addSubview(iView)
        
        iView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
//    func configureTextView(recipe: Recipe) {
//        ingredientTextView.text = recipe.ingredientLines.map({"● \($0)"}).joined(separator: "\n")
//    }
}
