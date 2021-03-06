//
//  IngredientController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/17/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class IngredientController: UIViewController {
        
    // MARK: - Properties
    
    let ingredientTextView: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 20, weight: .medium))
        text.sizeToFit()
        text.backgroundColor = UIColor.lightBlue
        text.textColor = .white
        return text
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
    }

    // MARK: - Helper function
    
    func configurationText(recipe: Recipe) {
        ingredientTextView.text = recipe.ingredientLines.map({"● \($0)"}).joined(separator: "\n")
    }
    
    private func layoutUI() {
        view.addSubview(ingredientTextView)
        
        ingredientTextView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
