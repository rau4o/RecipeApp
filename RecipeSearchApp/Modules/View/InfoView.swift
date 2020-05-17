//
//  InfoView.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/17/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import BmoViewPager

class InfoView: UIView {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel(text: "Info", font: .systemFont(ofSize: 23, weight: .medium), textAlignment: .center)
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
        view.autoFocus = false
        return view
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        navigationBar.viewPager = viewPager
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        addSubviews([titleLabel,navigationBar,viewPager])
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
        }
        navigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        viewPager.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBar.snp.bottom).inset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    
    func configureInfo(recipe: Recipe) {
        
    }
}


extension InfoView: BmoViewPagerDelegate, BmoViewPagerDataSource {
    
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.strokeWidth     : 1.0,
            NSAttributedString.Key.strokeColor     : UIColor.black,
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
                return "Diet Labels"
            case 2:
                return "Health Labels"
            default:
                break
        }
        return ""
//        return page == 0 ? "First" : "Second"
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0:
            let vc = UIViewController()
            return vc
        case 1:
            let vc2 = UIViewController()
            return vc2
        case 2:
            return UIViewController()
        default:
            break
        }
        return UIViewController()
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemSize(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> CGSize {
        return CGSize(width: navigationBar.bounds.width / 3, height: navigationBar.bounds.height)
    }
    
    
}
