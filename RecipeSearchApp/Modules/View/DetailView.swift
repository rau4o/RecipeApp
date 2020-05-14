//
//  DetailView.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - Properties
    
    var dismissAction: (() -> Void)?
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(handleBackButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private let categoryFoodLabel: UILabel = {
        return UILabel(font: .systemFont(ofSize: 15, weight: .medium), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()

    private let titleFood: UILabel = {
        return UILabel(font: .systemFont(ofSize: 20, weight: .light), numberOfLines: 0, textAlignment: .center)
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
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()
    
    private let ingredientsLabel: UILabel = {
        return UILabel(text: "INGREDIENTS", font: .systemFont(ofSize: 23, weight: .medium), textAlignment: .center)
    }()
    
    private let linkButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let descLinkLabel: UILabel = {
        let label = UILabel(text: "Full Recipe in link or just swipe:", font: .systemFont(ofSize: 16, weight: .medium), numberOfLines: 0, textAlignment: .center)
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        
        addSubviews([imageView,categoryFoodLabel,titleFood,stackView,ingredientsLabel,backButton,descLinkLabel,linkButton])
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        
        backButton.anchor(top: imageView.topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 100, height: 40)
        
        categoryFoodLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        titleFood.anchor(top: categoryFoodLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 32)
        
        stackView.anchor(top: titleFood.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        ingredientsLabel.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        descLinkLabel.anchor(top: ingredientsLabel.bottomAnchor, left: leftAnchor, bottom: linkButton.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 16)
        
        linkButton.anchor(top: descLinkLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 40)
    }
    
    func configureUI(recipe: Recipe) {
        imageView.kf.setImage(with: URL(string: recipe.image))
        categoryFoodLabel.text = recipe.source
        titleFood.text = recipe.label
        labelOne.text = "Calories:\(Int(recipe.calories))"
        labelTwo.text = "Weight:\(Int(recipe.totalWeight))"
        labelThree.text = recipe.dietLabels.map({ ("\($0)")}).joined(separator: ",")
        linkButton.setTitle(recipe.shareAs, for: .normal)
    }
    
    // MARK: - Selectors
    
    @objc private func handleBackButton(_ sender: UIButton) {
        dismissAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
