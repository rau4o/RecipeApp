//
//  FavoriteView.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/17/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class FavoriteView: UIView {
    
    var scrollView = UIScrollView()
    
    private let label: UILabel = {
        let label = UILabel(text: "hello world", font: UIFont.systemFont(ofSize: 25), numberOfLines: 0, textAlignment: .center, textColor: .black)
        label.backgroundColor = .orange
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel(text: "hello Kazakhstan", font: UIFont.systemFont(ofSize: 25), numberOfLines: 0, textAlignment: .center, textColor: .black)
        label.backgroundColor = .purple
        return label
    }()
    
    private let mainLabel2: UILabel = {
        let label = UILabel(text: "hello Kazakhstan", font: UIFont.systemFont(ofSize: 25), numberOfLines: 0, textAlignment: .center, textColor: .black)
        label.backgroundColor = .purple
        return label
    }()
    
    private let mainLabel3: UILabel = {
        let label = UILabel(text: "hello Kazakhstan", font: UIFont.systemFont(ofSize: 25), numberOfLines: 0, textAlignment: .center, textColor: .black)
        label.backgroundColor = .purple
        return label
    }()
    
    private let mainLabel4: UILabel = {
        let label = UILabel(text: "hello Kazakhstan", font: UIFont.systemFont(ofSize: 25), numberOfLines: 0, textAlignment: .center, textColor: .black)
        label.backgroundColor = .purple
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white 
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        addSubview(label)
        addSubview(button)
        addSubview(mainLabel)
        addSubview(mainLabel2)
        addSubview(mainLabel3)
        addSubview(mainLabel4)
        
        label.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(16)
            make.height.equalTo(70)
        }
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
        
        mainLabel2.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
        
        mainLabel3.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel2.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
        
        mainLabel4.snp.makeConstraints { (make) in
            make.top.equalTo(mainLabel3.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }
}
