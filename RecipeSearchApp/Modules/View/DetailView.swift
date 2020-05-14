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
        let label = UILabel(font: .systemFont(ofSize: 15, weight: .medium), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        return label
    }()

    private let titleFood: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 20, weight: .light), numberOfLines: 0, textAlignment: .center)
        return label
    }()
    
    private let labelOne: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        return label
    }()
    
    private let labelTwo: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        return label
    }()
    
    private let labelThree: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        return label
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelOne,labelTwo,labelThree])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()
    
    private let ingredientsLabel: UILabel = {
        let label = UILabel(text: "INGREDIENTS", font: .systemFont(ofSize: 25, weight: .medium), textAlignment: .center)
        return label
    }()
    
    private let listIngredientsLabel: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 14, weight: .medium))
        text.sizeToFit()
        text.backgroundColor = .red
        return text
    }()
    
    private let textView: UITextView = {
        let text = UITextView(isEditable: false, font: .systemFont(ofSize: 15, weight: .medium))
        text.sizeToFit()
        text.backgroundColor = .orange
        return text
    }()
    
    private let linkButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        
        addSubviews([imageView,categoryFoodLabel,titleFood,stackView,ingredientsLabel,listIngredientsLabel,backButton,textView,linkButton])
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        
        backButton.anchor(top: imageView.topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 100, height: 40)
        
        categoryFoodLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        titleFood.anchor(top: categoryFoodLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 32)
        
        stackView.anchor(top: titleFood.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        ingredientsLabel.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 24)
        
        listIngredientsLabel.anchor(top: ingredientsLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 220)
        
        textView.anchor(top: listIngredientsLabel.bottomAnchor, left: leftAnchor, bottom: linkButton.topAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 16, paddingBottom: 20, paddingRight: 16)
        
        linkButton.anchor(top: textView.bottomAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 10, paddingRight: 16)
    }
    
    func configureUI(recipe: Recipe) {
        imageView.kf.setImage(with: URL(string: recipe.image))
        categoryFoodLabel.text = recipe.source
        titleFood.text = recipe.label
        labelOne.text = "Calories:\(Int(recipe.calories))"
        labelTwo.text = "Weight:\(Int(recipe.totalWeight))"
        labelThree.text = recipe.dietLabels.map({ ("\($0)")}).joined(separator: ",")
        listIngredientsLabel.text = recipe.ingredientLines.map({ ("● \($0)")}).joined(separator: "\n")
        textView.text = recipe.healthLabels.map({ ("\($0)")}).joined(separator: "\n")
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
