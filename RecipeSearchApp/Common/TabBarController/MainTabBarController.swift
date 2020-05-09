//
//  MainTabBarController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        let searchController = UINavigationController(rootViewController: SearchController())
        searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        viewControllers = [searchController]
    }
}

