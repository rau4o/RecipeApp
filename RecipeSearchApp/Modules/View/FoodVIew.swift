//
//  FoodVIew.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/17/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import SnapKit

class FoodVIew: UIView {
    
    // MARK: - Properties
    
    private let categoryFoodLabel: UILabel = {
        return UILabel(font: .systemFont(ofSize: 18, weight: .medium), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()

    private let titleFood: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 25, weight: .light), numberOfLines: 0, textAlignment: .center)
        return label
    }()
    
    private let labelOne: UILabel = {
        return UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    private let labelTwo: UILabel = {
        return UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    private let labelThree: UILabel = {
        return UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelOne,labelTwo,labelThree])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 5
        return stack
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        [categoryFoodLabel, titleFood, stackView].forEach {
            addSubview($0)
        }
        
        categoryFoodLabel.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(16)
        }
        titleFood.snp.makeConstraints { (make) in
            make.top.equalTo(categoryFoodLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(titleFood.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
        }
    }
    
    func configureFoodView(recipe: Recipe) {
        categoryFoodLabel.text = recipe.source
        titleFood.text = recipe.label
        labelOne.text = "Calories:\(Int(recipe.calories))"
        labelTwo.text = "Weight:\(Int(recipe.totalWeight))"
        labelThree.text = "Yield:\(recipe.yield)"
    }
}
