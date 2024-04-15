//
//  Item.swift
//  MyTeaTime
//
//  Created by Lyosha's MacBook   on 4/15/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
