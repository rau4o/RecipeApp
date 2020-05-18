//
//  DietController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class DietController: UIViewController {
    
    // MARK: - Properties
    
    let dietTextView: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 20, weight: .medium))
        text.sizeToFit()
        text.backgroundColor = UIColor.lightBlue
        text.textColor = .white
        return text
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    // MARK: - Helper function
    
    func configurationText(recipe: Recipe) {
        dietTextView.text = recipe.healthLabels.map({"● \($0)"}).joined(separator: "\n")
    }
    
    private func layoutUI() {
        view.addSubview(dietTextView)
        
        dietTextView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
