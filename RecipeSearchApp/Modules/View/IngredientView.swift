//
//  IngredientView.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/18/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class IngredientView: UIView {
    
    let ingredientTextView: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 20, weight: .medium))
        text.sizeToFit()
        text.textColor = .black
        return text
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        addSubview(ingredientTextView)
        
        ingredientTextView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
            make.height.equalTo(300)
        }
    }
}
