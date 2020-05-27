//
//  UIViewController+Extension.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/26/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func changeVC(vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
