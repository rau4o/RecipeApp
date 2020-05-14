//
//  MainCollectionCell.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Kingfisher

class MainCollectionCell: UITableViewCell {
    
    // MARK: - Properties
    
    let imageUrl: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleToFill
        return image
    }()
    
    let categoryFoodLabel: UILabel = {
        return UILabel(font: .systemFont(ofSize: 14, weight: .medium), textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    let titleFood: UILabel = {
        return UILabel(font: .systemFont(ofSize: 16, weight: .light), numberOfLines: 0)
    }()
    
    let labelOne: UILabel = {
        return UILabel(font: .systemFont(ofSize: 12, weight: .semibold), textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    let labelTwo: UILabel = {
        return UILabel(font: .systemFont(ofSize: 12, weight: .semibold), textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    let labelThree: UILabel = {
        return UILabel(font: .systemFont(ofSize: 12, weight: .semibold), textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelOne,labelTwo,labelThree])
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    func configureCell(recipe: Recipe) {
        imageUrl.kf.indicatorType = .activity
        imageUrl.kf.setImage(with: URL(string: (recipe.image)))
        titleFood.text = recipe.label
        categoryFoodLabel.text = recipe.source
        labelOne.text = "Calories:\(Int(recipe.calories))"
        labelTwo.text = "Weight:\(Int(recipe.totalWeight))"
        labelThree.text = recipe.dietLabels.map({ ("\($0)")}).joined(separator: ",")
    }
    
    private func layoutUI() {
        addSubviews([imageUrl,categoryFoodLabel,titleFood,stackView])
        
        imageUrl.anchor(top: topAnchor, left: leftAnchor, bottom: categoryFoodLabel.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
        categoryFoodLabel.anchor(top: imageUrl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        titleFood.anchor(top: categoryFoodLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        stackView.anchor(top: titleFood.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 10, paddingRight: 16, height: 24)
    }
}
