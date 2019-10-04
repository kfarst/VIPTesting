//
//  MainPresenter.swift
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

protocol MainPresentationLogic {
    func displayCurrentTime(response: Main.CurrentTime.Response)
    func setUserInfo(response: Main.UserInfo.Response)
    func updateUserInfo(response: Main.UserInfo.Response)
    func showAlert(response: MessageProtocol)
    func showToast(response: MessageProtocol)
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: (MainDisplayLogic & AlertDelegate)?

    private var dateFormatter: DateFormatter
    
    init(dateFormatter: DateFormatter = DateFormatter.clockTime) {
        self.dateFormatter = dateFormatter
    }
    
    func displayCurrentTime(response: Main.CurrentTime.Response) {
        let displayTime = dateFormatter.string(from: response.date)
        let viewModel = Main.CurrentTime.ViewModel(displayTime: displayTime)
        viewController?.updateClockTime(viewModel: viewModel)
    }
    
    func setUserInfo(response: Main.UserInfo.Response) {
        let viewModel = Main.UserInfo.ViewModel(text: response.text)
        viewController?.setUserInfo(viewModel: viewModel)
    }
    
    func updateUserInfo(response: Main.UserInfo.Response) {
        let viewModel = Main.UserInfo.ViewModel(text: response.text)
        viewController?.updateFromUserInfo(viewModel: viewModel)
    }
    
    func showAlert(response: MessageProtocol) {
        let viewModel = response
        viewController?.showAlert(viewModel: viewModel)
    }
    
    func showToast(response: MessageProtocol) {
        let viewModel = response
        viewController?.showToast(viewModel: viewModel)
    }
}

