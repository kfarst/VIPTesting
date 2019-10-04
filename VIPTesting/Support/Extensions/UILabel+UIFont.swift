//
//  UILabel+UIFont.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/10/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(withFont font: CustomFont, forTextStyle textStyle: UIFont.TextStyle) {
        self.init()
        
        let scaledFont = ScaledFont(fontName: font.rawValue)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = scaledFont.font(forTextStyle: textStyle)
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
        self.minimumScaleFactor = 0.4
    }
}
