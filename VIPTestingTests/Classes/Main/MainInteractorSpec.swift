//
//  MainInteractorSpec.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/12/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

@testable import VIPTesting
import Quick
import Nimble

class MainInteractorSpec: QuickSpec {
    override func spec() {
        describe("Interactor: Main") {
            var interactor: MainInteractor!
            var presenter: MainPresenterMock!
            var storageMock: StorageMock!
            
            beforeEach {
                storageMock = StorageMock()
                interactor = MainInteractor(storage: storageMock)
                presenter = MainPresenterMock()

                interactor.presenter = presenter
            }
            
            describe("#saveUserInfo") {
                describe("with a valid name") {
                    it("shows a toast") {
                        let request = Main.UserInfo.Request(name: "Bob")
                        interactor.saveUserInfo(request: request)
                        expect(presenter.showToastCalled).to(beTrue())
                    }
                    
                    it("updates the user state") {
                        let request = Main.UserInfo.Request(name: "Anne")
                        interactor.saveUserInfo(request: request)
                        expect(presenter.setUserInfoCalled).to(beTrue())
                    }
                    
                    it("saves the user name to storage") {
                        let request = Main.UserInfo.Request(name: "Anne")
                        interactor.saveUserInfo(request: request)
                        expect(storageMock.valueSet).to(beTrue())
                    }
                }
                
                describe("with an invalid name") {
                    it("shows an alert") {
                        let request = Main.UserInfo.Request(name: nil)
                        interactor.saveUserInfo(request: request)
                        expect(presenter.showAlertCalled).to(beTrue())
                    }
                    
                    it("does not save the user name to storage") {
                        let request = Main.UserInfo.Request(name: nil)
                        interactor.saveUserInfo(request: request)
                        expect(storageMock.valueSet).to(beFalse())
                    }
                }
            }
            
            describe("#getUserInfo") {
                it("sets the user name to be presented") {
                    interactor.getUserInfo()
                    expect(presenter.setUserInfoCalled).to(beTrue())
                }
                
                it("fetches user info from storage") {
                    interactor.getUserInfo()
                    expect(storageMock.valueFetched).to(beTrue())
                }
            }
            
            describe("#updateCurrentTime") {
                // TODO
            }

            describe("#showGreeting") {
                // TODO
            }
            
            describe("#userInfoChanged") {
                // TODO
            }
        }
    }
}
