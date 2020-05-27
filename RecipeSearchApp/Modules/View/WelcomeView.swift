//
//  WelcomeView.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/26/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import TransitionButton

class WelcomeView: UIView {
    
    // MARK: - Properties
    
    var continueAction: (() -> Void)?
    
    let iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg")
        return image
    }()
    
    let nextButton: TransitionButton = {
        let button = TransitionButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = UIColor.orangeCustomColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleNextButton(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let titleLabel: UILabel = {
        return UILabel(text: "Delicious", font: UIFont.systemFont(ofSize: 70, weight: .medium), numberOfLines: 0, textAlignment: .center, textColor: .white)
    }()
    
    private let descLabel: UILabel = {
        return UILabel(text: "Recipes for every day!", font: UIFont.systemFont(ofSize: 35, weight: .medium), numberOfLines: 0, textAlignment: .center, textColor: .white)
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
    
    private func layoutUI() {
        [iconImageView,nextButton,titleLabel,descLabel].forEach {
            addSubview($0)
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(100)
        }
    }
    
    @objc private func handleNextButton(_ sender: UIButton) {
        continueAction?()
    }
}
