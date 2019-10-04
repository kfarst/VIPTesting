//
//  MainInteractorMock.swift
//  VIPTestingTests
//
//  Created by Kevin Farst on 10/3/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import Foundation
@testable import VIPTesting

class MainInteractorMock: MainBusinessLogic {
    var updateCurrentTimeCalled = false
    var saveUserInfoCalled = false
    var getUserInfoCalled = false
    var showGreetingCalled = false
    var userInfoChangedCalled = false
        
    func updateCurrentTime() {
        updateCurrentTimeCalled = true
    }
    
    func saveUserInfo(request: Main.UserInfo.Request) {
        saveUserInfoCalled = true
    }
    
    func getUserInfo() {
        getUserInfoCalled = true
    }
    
    func showGreeting() {
        showGreetingCalled = true
    }
    
    func userInfoChanged(request: Main.UserInfo.Request) {
        userInfoChangedCalled = true
    }
}
