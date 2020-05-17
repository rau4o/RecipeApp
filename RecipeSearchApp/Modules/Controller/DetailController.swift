//
//  DetailController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import AnchoredBottomSheet

class DetailController: UIViewController {
    
    // MARK: - Properties
    
    var recipe: Recipe?
    
    var detailView = DetailView(frame: UIScreen.main.bounds)
    var scrollView = UIScrollView()
    static let shared = DetailController()

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
    }
}

extension DetailController {
    
    func initialSetup() {
        view.backgroundColor = .white
        layoutUI()
    }
    
    private func layoutUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        
        scrollView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view.snp.center)
            make.width.equalTo(self.view.snp.width)
            make.top.equalTo(self.view.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        detailView.snp.makeConstraints { (make) in
            make.center.equalTo(self.scrollView.snp.center)
            make.width.equalTo(self.scrollView.snp.width)
            make.top.equalTo(self.scrollView.snp.top)
            make.bottom.equalTo(self.scrollView.snp.bottom)
        }
    }
}
