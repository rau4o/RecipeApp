//
//  FavoriteController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class FavoriteController: UIViewController {
    
    var favView = FavoriteView()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
    }
}

private extension FavoriteController {
    
    func intialSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.lightBlue
        setupNavBar()
        layoutUI()
    }
    
    private func setupNavBar() {
        title = "Favorites"
        
        navigationController?.navigationBar.barTintColor = UIColor.darkBlue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white]
    }
    
    private func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(favView)
        
        scrollView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
            make.width.equalTo(self.view.snp.width)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        favView.snp.makeConstraints { (make) in
            make.center.equalTo(self.scrollView.snp.center)
            make.width.equalTo(self.scrollView.snp.width)
            make.top.equalTo(self.scrollView.snp.top)
            make.bottom.equalTo(self.scrollView.snp.bottom)
        }
    }
}
