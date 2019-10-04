//
//  MainViewControllerSpec.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/12/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import Quick
import Nimble
@testable import VIPTesting

class MainViewControllerSpec: QuickSpec {
    override func spec() {
        var interactor: MainInteractorMock!
        var viewController: MainViewController!
        
        beforeEach {
            interactor = MainInteractorMock()
            viewController = MainViewController()
            
            viewController.interactor = interactor
        }
        
        describe("#viewDidLoad") {
            it("fetches the user info") {
                viewController.viewDidLoad()
                expect(interactor.getUserInfoCalled).to(beTrue())
            }
        }
    }
}
