//
//  SearchCell.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/7/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {
    
    // MARK: - Views
    
    private let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.addShadow()
        return view
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel(font: .boldSystemFont(ofSize: 15), numberOfLines: 0)
        label.minimumScaleFactor = 0.8
        label.sizeToFit()
        return label
    }()
    
    lazy private var descLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 12))
        return label
    }()
    
    lazy private var caloriesLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 12))
        return label
    }()
    
    lazy private var nutrientsLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 12), numberOfLines: 0)
        label.minimumScaleFactor = 0.8
        label.sizeToFit()
        return label
    }()
    
    let imageUrl: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,descLabel,caloriesLabel,nutrientsLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.alignment = .fill
        return stack
    }()
    
    // MARK: - Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    private func layoutUI() {
        addSubview(cardView)
        cardView.addSubview(imageUrl)
        cardView.addSubview(stackView)
        
        cardView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        
        imageUrl.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 100)
        
        stackView.anchor(top: imageUrl.topAnchor, left: imageUrl.rightAnchor, bottom: imageUrl.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 10)
    }
    
    func configureCell(recipe: Recipe) {
        titleLabel.text = "Recipe title: \(recipe.label)"
        descLabel.text = "Source site identifier: \(recipe.source)"
        caloriesLabel.text = "Total energy: \(recipe.calories) kcal"
        nutrientsLabel.text = recipe.dietLabels.map({ ("Diet label: \($0)")}).joined(separator: ",")
        imageUrl.kf.indicatorType = .activity
        if let url = URL(string: recipe.image) {
            imageUrl.kf.setImage(with: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
