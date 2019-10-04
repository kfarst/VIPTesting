//
//  MainViewControllerMock.swift
//  VIPTestingTests
//
//  Created by Kevin Farst on 10/3/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import Foundation
@testable import VIPTesting

class MainViewControllerMock: MainDisplayLogic {
    var currentTimeViewModel: Main.CurrentTime.ViewModel!
    var userInfoViewModel: Main.UserInfo.ViewModel!

    func updateClockTime(viewModel: Main.CurrentTime.ViewModel) {
        currentTimeViewModel = viewModel
    }
    
    func setUserInfo(viewModel: Main.UserInfo.ViewModel) {
        userInfoViewModel = viewModel
    }
    
    func updateFromUserInfo(viewModel: Main.UserInfo.ViewModel) {
        userInfoViewModel = viewModel
    }
}

extension MainViewControllerMock: AlertDelegate {
    func showAlert(viewModel: MessageProtocol) {
        // TODO
    }
    
    func showToast(viewModel: MessageProtocol) {
        // TODO
    }
}
