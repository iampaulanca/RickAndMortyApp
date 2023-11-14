//
//  Item.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/12/23.
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
