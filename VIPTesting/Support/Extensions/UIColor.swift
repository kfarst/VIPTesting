//
//  UIColor.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/11/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import UIKit

extension UIColor {
    var imageFromColor: UIImage? {
        let size = CGSize(width: 1, height: 1)
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setFillColor(cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}
