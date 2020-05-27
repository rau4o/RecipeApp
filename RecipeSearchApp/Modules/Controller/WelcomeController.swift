//
//  WelcomeController.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/26/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import TransitionButton

class WelcomeController: UIViewController {
    
    // MARK: - Properties
    
    let welcomeView = WelcomeView()
    let menuController = MenuController()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        activiteClosure()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layoutUI() {
        view.addSubview(welcomeView)
        
        welcomeView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func activiteClosure() {
        welcomeView.continueAction = { [weak self] in
            guard let self = self else {return}
            self.welcomeView.nextButton.startAnimation()
            let qualityOfServiceClass = DispatchQoS.QoSClass.background
            let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
            backgroundQueue.async(execute: {
                sleep(1)
                DispatchQueue.main.async(execute: { () -> Void in
                    self.welcomeView.nextButton.stopAnimation(animationStyle: .expand, completion: {
                        self.changeVC(vc: SceneDelegate.shared.getConfiguredController())
                    })
                })
            })
        }
    }
}
