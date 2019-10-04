//
//  MessageBoxView.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/11/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import UIKit

class MessageBoxView: UIView {
    var message: String! {
        willSet(text) {
            messageLabel.text = text
        }
    }
    
    var messageColor: AlertType! {
        willSet(type) {
            coloredDotView.backgroundColor = type.color
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        
        addSubview(messageLabel)
        addSubview(coloredDotView)
        addConstraints()
    }
    
    private func addConstraints() {
        let anchors = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            coloredDotView.topAnchor.constraint(equalTo: topAnchor),
            coloredDotView.bottomAnchor.constraint(equalTo: bottomAnchor),
            coloredDotView.leftAnchor.constraint(equalTo: leftAnchor),
            coloredDotView.rightAnchor.constraint(equalTo: messageLabel.leftAnchor),
            coloredDotView.widthAnchor.constraint(equalToConstant: 10)
        ]
        
        NSLayoutConstraint.activate(anchors)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
    }
    
    lazy private var messageLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.adjustsFontSizeToFitWidth = true
        l.textColor = .white
        l.font = .preferredFont(forTextStyle: .headline)
        l.textAlignment = .center
        return l
    }()
    
    lazy private var coloredDotView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
}
