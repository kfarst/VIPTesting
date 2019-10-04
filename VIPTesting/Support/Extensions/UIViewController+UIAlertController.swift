//
//  UIViewController+UIAlertController.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/11/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import UIKit

enum AlertType: String {
    case error
    case message
    case warning
    
    var color: UIColor {
        switch self {
        case .message: return .green
        case .error: return .red
        case .warning: return .yellow
        }
    }
}

protocol MessageProtocol {
    var text: String? { set get }
    var type: AlertType? { set get }
}

protocol AlertDelegate: class {
    func showAlert(viewModel: MessageProtocol)
    func showToast(viewModel: MessageProtocol)
}

extension UIViewController: AlertDelegate {
    func showAlert(viewModel: MessageProtocol) {
        let alert = UIAlertController(
            title: viewModel.type?.rawValue.uppercased(),
            message: viewModel.text,
            preferredStyle: .alert
        )
        
        alert.view.tintColor = .orange
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default) { _ in
                alert.dismiss(animated: true)
            }
        )
        
        present(alert, animated: true)
    }
    
    func showToast(viewModel: MessageProtocol) {
        DispatchQueue.main.async {
            let v = MessageBoxView()
            v.message = viewModel.text
            v.messageColor = viewModel.type
            v.alpha = 0
            
            guard let superView = self.navigationController?.view ?? self.view else {
                return
            }
            
            superView.insertSubview(v, at: superView.subviews.count)
            
            NSLayoutConstraint.activate([
                v.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10),
                v.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
                v.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
                v.heightAnchor.constraint(equalToConstant: 50)
                ])
            
            UIView.animate(withDuration: 0.3) {
                v.alpha = 1
            }
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    v.alpha = 0
                }, completion: { (completed) in
                    if completed {
                        v.removeFromSuperview()
                    }
                })
            }
        }
    }

}
