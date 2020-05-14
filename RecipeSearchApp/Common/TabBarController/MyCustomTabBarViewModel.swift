//
//  MyCustomTabBarViewModel.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/14/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

import UIKit
struct MyCustomTabBarViewModel: BEKTabBarViewModelType {
    let heightRatio: CGFloat = CGFloat(TabbarHeightRatios.bestSize.rawValue)
    let containerColor: UIColor = .white
    let hideTitle: Bool = true
    let animationDuration: CGFloat = 0.3
    let animated: Bool = true
    let shadowColor: UIColor = .white
    let shadowRadius: CGFloat = 16
    let containerBorderWidth: CGFloat = 1.0
    let containerBorderColor: UIColor = .gray
    let selectedTextColor: UIColor = .yellow
    let selectedTextFont: UIFont = .systemFont(ofSize: 13)
    let normalTextColor: UIColor = .lightGray
    let normalTextFont: UIFont = .systemFont(ofSize: 11)
    let topCornerRadius: CGFloat = TabbarHeightRatios.bestSize.cornerRadius()
    let bottomCornerRadius: CGFloat = TabbarHeightRatios.bestSize.cornerRadius()
    let containerInsets: UIEdgeInsets = TabbarHeightRatios.bestSize.containerInsets()
    let selectionCircleRadius: CGFloat = TabbarHeightRatios.bestSize.circleRadius()
    let selectionCircleBorderWidth: CGFloat = 0.0
    let selectionCircleBorderColor: UIColor = .clear
    let selectionCircleBackgroundColor: UIColor = .orange
    let textOffset: CGFloat = 0
    init() {}
}
