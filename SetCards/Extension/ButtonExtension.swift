//
//  ButtonExtension.swift
//  SetCards
//
//  Created by Abanoub on 8/26/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func addBottomBorderWithColor(width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = UIColor.blue.cgColor
    }
    
    func removeButtonBorder() {
        self.layer.borderWidth = 0
    }
}
