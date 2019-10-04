//
//  BorderedTextField.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/11/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import UIKit

class BorderedTextField: UITextField {
    private let borderColor: UIColor
    private var border: CALayer?

    init(borderColor: UIColor = UIColor.white.withAlphaComponent(0.5)) {
        self.borderColor = borderColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reset()
    }
    
    private func reset() {
        border?.removeFromSuperlayer()
        
        let line = CALayer()
        line.frame = CGRect(x: 0.0, y: frame.height + 5, width: frame.width, height: 1.0)
        line.backgroundColor = borderColor.cgColor
        border = line
        layer.addSublayer(border!)
    }
}
