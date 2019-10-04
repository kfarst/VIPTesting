//
//  DateFormatter.swift
//  VIPTesting
//
//  Created by Kevin Farst on 9/10/19.
//  Copyright © 2019 Kevin Farst. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var clockTime: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "h:mm:ss a"
        return f
    }
}
