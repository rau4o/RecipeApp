//
//  DetailController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/9/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    // MARK: - Properties
    
    var detailView = DetailView()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        layoutUI()
        activateViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Helper function
    
    private func activateViewModel() {
        detailView.dismissAction = { [weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func layoutUI() {
        view.addSubview(detailView)
        
        detailView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
