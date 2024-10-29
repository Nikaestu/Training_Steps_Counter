//
//  Step.swift
//  stepsCounter
//
//  Created by Dylan Le Hir on 19/08/2024.
//

import Foundation

struct Counter {
    var count: Int
    var history: [HistoryEntry]

    mutating func increment() {
        count += 1
    }

    mutating func reset() {
        count = 0
    }

    mutating func save(_ historyEntry: HistoryEntry) {
        history.append(historyEntry)
    }

    mutating func cleanTable() {
        history.removeAll()
    }
}

struct HistoryEntry: Hashable {
    var count: Int
    var date: String
}
