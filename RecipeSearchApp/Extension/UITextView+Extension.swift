//
//  UITextView+Extension.swift
//  RecipeSearchApp
//
//  Created by rau4o on 5/14/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension UITextView {
    public convenience init(isEditable: Bool, font: UIFont) {
        self.init()
        self.isEditable = isEditable
        self.font = font
    }
}
