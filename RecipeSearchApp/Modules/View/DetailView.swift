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
    var showRecipeAction: (() -> Void)?
    
    var foodView: FoodVIew = {
        let view = FoodVIew()
        return view
    }()
    
    var infoView: InfoView = {
        let view = InfoView()
        return view
    }()
    
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
    
    private let descLinkLabel: UILabel = {
        let label = UILabel(text: "Full Recipe in link or just swipe:", font: .systemFont(ofSize: 16, weight: .medium), numberOfLines: 0, textAlignment: .center)
        label.sizeToFit()
        return label
    }()
    
//    lazy private var mainStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [categoryFoodLabel, titleFood, stackView, ingredientsLabel, descLinkLabel])
//        stack.distribution = .fill
//        stack.axis = .vertical
//        stack.spacing = 10
//        stack.alignment = .center
////        stack.setCustomSpacing(15, after: categoryFoodLabel)
////        stack.setCustomSpacing(20, after: titleFood)
////        stack.setCustomSpacing(20, after: stackView)
////        stack.setCustomSpacing(0, after: ingredientsLabel)
//        return stack
//    }()
    
    lazy private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.isScrollEnabled = false
        return scroll
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        
        addSubviews([imageView,backButton,foodView,infoView])
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 200)
        
        backButton.anchor(top: imageView.topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 100, height: 40)
        
        foodView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        infoView.snp.makeConstraints { (make) in
            make.top.equalTo(foodView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
            
        }
        
        
        
//        scrollView.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
//        categoryFoodLabel.centerX(inView: mainStackView)
//        titleFood.centerX(inView: mainStackView)
//        stackView.centerX(inView: mainStackView)
//        ingredientsLabel.centerX(inView: mainStackView)
//        descLinkLabel.centerX(inView: mainStackView)
        
//        mainStackView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    func configureUI(recipe: Recipe) {
        imageView.kf.setImage(with: URL(string: recipe.image))
    }
    
    // MARK: - Selectors
    
    @objc private func handleBackButton(_ sender: UIButton) {
        dismissAction?()
    }
    
    @objc private func viewRecipeAction(_ sender: UIButton) {
        showRecipeAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
