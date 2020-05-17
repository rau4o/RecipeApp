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
    
    private let categoryFoodLabel: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 20, weight: .medium), textColor: .white)
        label.backgroundColor = .orange
        return label
    }()
    
    private let titleFood: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 25, weight: .light), numberOfLines: 0, textColor: .white)
        label.addShadowLabel()
        label.sizeToFit()
        return label
    }()
    
    private let labelOne: UILabel = {
        return UILabel(font: .systemFont(ofSize: 12, weight: .semibold), textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    private let labelTwo: UILabel = {
        return UILabel(font: .systemFont(ofSize: 12, weight: .semibold), textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
    }()
    
    private let labelThree: UILabel = {
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
        [imageUrl,categoryFoodLabel,titleFood].forEach {
            addSubview($0)
        }
        
        imageUrl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
        }
        categoryFoodLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageUrl.snp.top).inset(5)
            make.left.equalTo(imageUrl.snp.left).inset(5)
        }
        titleFood.snp.makeConstraints { (make) in
            make.bottom.equalTo(imageUrl.snp.bottom).inset(5)
            make.left.equalTo(imageUrl.snp.left).inset(5)
            make.right.equalTo(imageUrl.snp.right).inset(5)
        }
    }
}
