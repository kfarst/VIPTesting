//
//  MainViewController.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/9/19.
//  Copyright (c) 2019 Kevin Farst. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainDisplayLogic: class {
    func updateClockTime(viewModel: Main.CurrentTime.ViewModel)
    func setUserInfo(viewModel: Main.UserInfo.ViewModel)
    func updateFromUserInfo(viewModel: Main.UserInfo.ViewModel)
}

class MainViewController: UIViewController {
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    
    private var firstLoad = true
    
    // MARK: Object lifecycle
    
    init(configurator: MainConfigurator = MainConfigurator()) {
        super.init(nibName: nil, bundle: nil)
        configurator.configure(viewController: self)
    }
    
    override func loadView() {
        view = mainView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        MainConfigurator().configure(viewController: self)
    }
    
    
    override func updateViewConstraints() {
        let constraints = [
            mainView.contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.contentStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        super.updateViewConstraints()
    }
    
    // MARK: Setup
    
    // MARK: Routing
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.saveButton.addTarget(self, action: #selector(saveUserInfo), for: .touchUpInside)
        mainView.greetButton.addTarget(self, action: #selector(showGreeting), for: .touchUpInside)
        
        guard let grayBackground = UIColor.lightGray.imageFromColor else { return }
        
        mainView.saveButton.setBackgroundImage(grayBackground, for: .disabled)
        mainView.greetButton.setBackgroundImage(grayBackground, for: .disabled)
        mainView.textField.delegate = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        mainView.addGestureRecognizer(gesture)
        
        interactor?.getUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clockTimer.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        clockTimer.suspend()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc private func saveUserInfo() {
        didTap()
        let request = Main.UserInfo.Request(name: mainView.textField.text)
        interactor?.saveUserInfo(request: request)
    }
    
    @objc private func showGreeting() {
        didTap()
        interactor?.showGreeting()
    }
    
    @objc func didTap() {
        mainView.textField.resignFirstResponder()
    }

    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    lazy private(set) var mainView: MainView = {
        return MainView(frame: UIScreen.main.bounds)
    }()
    
    lazy private var clockTimer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource(queue: .global())
        t.schedule(deadline: .now(), repeating: 1.0)
        t.setEventHandler { [weak self] in
            self?.interactor?.updateCurrentTime()
        }
        
        return t
    }()
}

extension MainViewController: MainDisplayLogic {
    func updateClockTime(viewModel: Main.CurrentTime.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.clockLabel.text = viewModel.displayTime
        }
    }
    
    func updateFromUserInfo(viewModel: Main.UserInfo.ViewModel) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.mainView.saveButton.isEnabled = viewModel.text?.isEmpty == false
        }
    }
    
    func setUserInfo(viewModel: Main.UserInfo.ViewModel) {
        mainView.textField.text = viewModel.text
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.mainView.saveButton.isEnabled = false
            self?.mainView.greetButton.isEnabled = viewModel.text?.isEmpty == false
        }
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let newText = text.replacingCharacters(in: textRange, with: string)
            let request = Main.UserInfo.Request(name: newText)
            interactor?.userInfoChanged(request: request)
        }
        return true
    }
}