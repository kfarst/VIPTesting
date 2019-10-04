//
//  MainView.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/10/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(clockLabel)
        contentStackView.addArrangedSubview(textField)
        contentStackView.addArrangedSubview(saveButton)
        contentStackView.addArrangedSubview(greetButton)
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy private(set) var contentStackView: UIStackView = {
        let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.axis = .vertical
        s.distribution = .fillEqually
        s.spacing = 50
        s.backgroundColor = .red
        return s
    }()
    
    lazy private(set) var textField: BorderedTextField = {
        let t = BorderedTextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        let frame = CGRect(x: 0, y: 0, width: 15, height: t.frame.height)
        let paddingView = UIView(frame: frame)
        t.leftView = paddingView
        t.leftViewMode = .always
        t.backgroundColor = .clear
        t.attributedPlaceholder = NSAttributedString(
            string: "Enter Your Name",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)]
        )
        t.tintColor = .orange
        t.textColor = .white
        return t
    }()
    
    lazy private(set) var greetButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        b.setTitleColor(.white, for: .normal)
        b.setTitle("Hi, iPhone!", for: .normal)
        b.layer.cornerRadius = 5
        return b
    }()
    
    lazy private(set) var saveButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .orange
        b.setTitleColor(.white, for: .normal)
        b.setTitle("Save", for: .normal)
        b.layer.cornerRadius = 5
        return b
    }()
    
    lazy private(set) var clockLabel: UILabel = {
        let l = UILabel(withFont: .digital, forTextStyle: .largeTitle)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.adjustsFontSizeToFitWidth = true
        l.adjustsFontForContentSizeCategory = true
        l.textColor = .orange
        l.textAlignment = .center
        return l
    }()
}

