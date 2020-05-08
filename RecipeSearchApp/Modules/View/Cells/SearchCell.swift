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
        view.backgroundColor = .red
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let imageUrl: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Initial
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    private func layoutUI() {
        addSubview(cardView)
        cardView.addSubview(imageUrl)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descLabel)
        
        cardView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        
        imageUrl.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 100)
        
        titleLabel.anchor(top: imageUrl.topAnchor, left: imageUrl.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 100, height: 40)
        
        descLabel.anchor(top: nil, left: titleLabel.leftAnchor, bottom: imageUrl.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 100, height: 30)
    }
    
    func configureCell(recipe: Recipe) {
        titleLabel.text = recipe.label
        descLabel.text = recipe.source
        imageUrl.kf.indicatorType = .activity
        if let url = URL(string: recipe.image) {
            imageUrl.kf.setImage(with: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
