//
//  DetailController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import SnapKit

class DetailController: UIViewController {
    
    // MARK: - Properties
    
    var detailView = DetailView(frame: UIScreen.main.bounds)
    static let shared = DetailController()
    var favorited: Bool = true
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = false
        return scroll
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        initialSetup()
        activateViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        self.tabBarController?.tabBar.layer.zPosition = -1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Helper function
    
    private func activateViewModel() {
        detailView.dismissAction = { [weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        }
        
        detailView.favoriteAction = { [weak self] in
            guard let self = self else {return}
            self.favorited = !self.favorited
            
            if self.favorited {
                self.detailView.favoriteButton.setImage(UIImage(named: "fav"), for: .normal)
            } else {
                self.detailView.favoriteButton.setImage(UIImage(named: "unfav"), for: .normal)
            }
        }
    }
}

// MARK: - Setup Layout

extension DetailController {
    
    func initialSetup() {
        view.backgroundColor = UIColor.lightBlue
        layoutUI()
    }
    
    private func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        
        scrollView.snp.makeConstraints { (make) in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(view.snp.width)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
        detailView.snp.makeConstraints { (make) in
            make.center.equalTo(scrollView.snp.center)
            make.width.equalTo(scrollView.snp.width)
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-150)
        }
    }
}
