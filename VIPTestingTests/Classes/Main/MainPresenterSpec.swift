//
//  MainPresenterSpec.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/12/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import Quick
import Nimble

@testable import VIPTesting

class MainPresenterSpec: QuickSpec {
    override func spec() {
        describe("Presenter: Main") {
            var presenter: MainPresenter!
            var viewController: MainViewControllerMock!
            var dateFormatter: DateFormatter!

            beforeEach {
                dateFormatter = DateFormatter()
                
                // only show the year for testing purposes
                dateFormatter.dateFormat = "YYYY"
                
                // initialize with test date formatter
                presenter = MainPresenter(dateFormatter: dateFormatter)
                viewController = MainViewControllerMock()
                
                presenter.viewController = viewController
            }
            
            describe("#displayCurrentTime") {
                it("returns the correct display time") {
                    let date = Date()
                    let response = Main.CurrentTime.Response(date: date)
                    presenter.displayCurrentTime(response: response)
                    
                    expect(
                        viewController.currentTimeViewModel.displayTime
                        ).to(equal(dateFormatter.string(from: date)))
                    
                }
            }
            
            describe("#displayCurrentTime") {
                // TODO
            }
            
            describe("#setUserInfo") {
                // TODO
            }
            
            describe("#updateUserInfo") {
                // TODO
            }
            
            describe("#showAlert") {
                // TODO
            }
            
            describe("#showToast") {
                // TODO
            }
        }
    }
}
