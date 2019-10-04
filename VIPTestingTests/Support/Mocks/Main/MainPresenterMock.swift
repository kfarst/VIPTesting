//
//  MainPresenterMock.swift
//  VIPTestingTests
//
//  Created by Kevin Farst on 9/13/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

@testable import VIPTesting

class MainPresenterMock: MainPresentationLogic {
    var displayCurrentTimeCalled = false
    var setUserInfoCalled = false
    var updateUserInfoCalled = false
    var showToastCalled = false
    var showAlertCalled = false
    
    func displayCurrentTime(response: Main.CurrentTime.Response) {
        displayCurrentTimeCalled = true
    }
    
    func setUserInfo(response: Main.UserInfo.Response) {
        setUserInfoCalled = true
    }
    
    func updateUserInfo(response: Main.UserInfo.Response) {
        updateUserInfoCalled = true
    }
    
    func showToast(response: MessageProtocol) {
        showToastCalled = true
    }
    
    func showAlert(response: MessageProtocol) {
        showAlertCalled = true
    }
}
