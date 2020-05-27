//
//  HeaderCollectionViewCell.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/26/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let foodLabelText: UILabel = {
        let label = UILabel(font: UIFont.systemFont(ofSize: 30, weight: .bold), numberOfLines: 0, textAlignment: .center, textColor: .white)
        label.addShadowLabel()
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    func configureCell(recipe: Recipe) {
        foodImage.kf.indicatorType = .activity
        foodImage.kf.setImage(with: URL(string: recipe.image))
        foodLabelText.text = recipe.label
    }
    
    private func layoutUI() {
        [foodImage, foodLabelText].forEach {
            addSubview($0)
        }
        
        foodImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        foodLabelText.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(150)
        }
    }
}
