//
//  UILabel+Extension.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/14/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension UILabel {
    public convenience init(text: String = "", font: UIFont, numberOfLines: Int = 0, textAlignment: NSTextAlignment = .left, textColor: UIColor = .black) {
        self.init()
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.textColor = textColor
    }
    
    func addShadowLabel() {
        minimumScaleFactor = 0.8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
    }
}
