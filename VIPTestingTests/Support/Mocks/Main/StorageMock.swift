//
//  StorageMock.swift
//  VIPTestingTests
//
//  Created by Kevin Farst on 10/3/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import Foundation
@testable import VIPTesting

class StorageMock: Storage {
    var valueSet = false
    var valueFetched = false
    var synchronizeCalled = false
    
    func set(_ value: Any?, forKey defaultName: String) {
        valueSet = true
    }
    
    func string(forKey defaultName: String) -> String? {
        valueFetched = true
        // stub returning pre-defined data
        return "TestName"
    }
    
    func synchronize() -> Bool {
        synchronizeCalled = true
        return true
    }
}
