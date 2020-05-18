//
//  DetailView.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import BmoViewPager

class DetailView: UIView {
    
    // MARK: - Properties
    var recipe: Recipe?

    var dismissAction: (() -> Void)?
    var showRecipeAction: (() -> Void)?
    
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
        let label = UILabel(font: .systemFont(ofSize: 18, weight: .medium), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        label.backgroundColor = UIColor.lightBlue
        return label
    }()

    private let titleFood: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 25, weight: .bold), numberOfLines: 0, textAlignment: .center, textColor: .white)
        label.backgroundColor = UIColor.lightBlue
        return label
    }()
    
    private let labelOne: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        label.backgroundColor = UIColor.darkBlue
        return label
    }()
    
    private let labelTwo: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        label.backgroundColor = UIColor.darkBlue
        return label
    }()
    
    private let labelThree: UILabel = {
        let label = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textAlignment: .center, textColor: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
        label.backgroundColor = UIColor.darkBlue
        return label
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelOne,labelTwo,labelThree])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.backgroundColor = UIColor.darkBlue
        return stack
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel(text: "Information", font: .systemFont(ofSize: 23, weight: .medium), textAlignment: .center, textColor: .white)
        label.backgroundColor = UIColor.darkBlue
        return label
    }()
    
    lazy private var viewPager: BmoViewPager = {
        let view = BmoViewPager()
        view.scrollable = true
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    lazy private var navigationBar: BmoViewPagerNavigationBar = {
        let view = BmoViewPagerNavigationBar()
        view.backgroundColor = UIColor.darkBlue
        view.autoFocus = false
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightBlue
        navigationBar.viewPager = viewPager
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        
        addSubviews([imageView, backButton, categoryFoodLabel, titleFood, stackView, infoLabel, navigationBar, viewPager])
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.top).inset(30)
            make.left.equalTo(imageView.snp.left).inset(5)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        categoryFoodLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        titleFood.snp.makeConstraints { (make) in
            make.top.equalTo(categoryFoodLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(25)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(titleFood.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(0)
            make.height.equalTo(35)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(0)
            make.left.right.equalToSuperview().inset(0)
            make.height.equalTo(40)
        }
        
        navigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(0)
            make.left.right.equalToSuperview().inset(0)
            make.height.equalTo(35)
        }
        
        viewPager.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBar.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(300)
        }
    }
    
    func configureUI(recipe: Recipe) {
        imageView.kf.setImage(with: URL(string: recipe.image))
        categoryFoodLabel.text = recipe.source
        titleFood.text = recipe.label
        labelOne.text = "Calories:\(Int(recipe.calories))"
        labelTwo.text = "Weight:\(Int(recipe.totalWeight))"
        labelThree.text = "Yield:\(recipe.yield)"
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

// MARK: - BmoViewPagerDelegate, BmoViewPagerDataSource

extension DetailView: BmoViewPagerDelegate, BmoViewPagerDataSource {
    
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.strokeWidth     : 2.0,
            NSAttributedString.Key.strokeColor     : UIColor.orange,
            NSAttributedString.Key.foregroundColor : UIColor.groupTableViewBackground
        ]
    }
    
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 3
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemTitle(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> String? {
        switch page {
            case 0:
                return "Ingredients"
            case 1:
                return "Diet"
            case 2:
                return "Health"
            default:
                break
        }
        return ""
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0:
            let vc = IngredientController()
            if let recipe = recipe {
                vc.configurationText(recipe: recipe)
            }
            return vc
        case 1:
            let vc2 = DietController()
            if let recipe = recipe {
                vc2.configurationText(recipe: recipe)
            }
            return vc2
        case 2:
            return UIViewController()
        default:
            break
        }
        return UIViewController()
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [NSAttributedString.Key.foregroundColor: UIColor.orange]
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemSize(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> CGSize {
        return CGSize(width: navigationBar.bounds.width / 3, height: navigationBar.bounds.height)
    }
}
