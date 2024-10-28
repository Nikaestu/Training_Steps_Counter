//
//  Step.swift
//  stepsCounter
//
//  Created by Dylan Le Hir on 19/08/2024.
//

import Foundation

struct Counter {
    var count: Int
    var history: [String]
    
    mutating func increment() {
        count += 1
    }
    
    mutating func reset() {
        count = 0
    }
    
    mutating func save(_ count: String) {
        history.append(count)
    }
    
    
    mutating func cleanTable() {
        history.removeAll()
    }
}
