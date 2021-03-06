//
//  MainModels.swift
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

enum Main {
    // MARK: Use cases
    
    enum CurrentTime {
        struct Request {
        }
        
        struct Response {
            let date: Date
        }
        
        struct ViewModel {
            let displayTime: String
        }
    }
    
    enum UserInfo {
        struct Request {
            let name: String?
        }
        
        struct Response: MessageProtocol {
            var type: AlertType?
            var text: String?
        }
        
        struct ViewModel {
            let text: String?
        }
    }
    
    enum Message {
        struct Request {
            
        }
        
        struct Response: MessageProtocol {
            var type: AlertType?
            var text: String?
        }
        
        struct ViewModel: MessageProtocol {
            var type: AlertType?
            var text: String?
        }
    }
}
