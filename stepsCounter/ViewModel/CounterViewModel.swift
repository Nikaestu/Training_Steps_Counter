//
//  StepViewModel.swift
//  stepsCounter
//
//  Created by Dylan Le Hir on 19/08/2024.
//

import Foundation
import SwiftUI

class CounterViewModel: ObservableObject {

    private var counter: Counter = Counter(count: 0, history: [])

    @Published var displayableCounter: String = "0 steps"
    @Published var displayableHistory: [String] = []

    func onIncrementTap() {
        counter.increment()
        updateDisplayableCounterFormat()
    }

    func onResetTap() {
        counter.reset()
        updateDisplayableCounterFormat()
    }

    func onSaveTap() {
        // Convert Date to Gregorian format
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.calendar = Calendar(identifier: .gregorian)
        let date = Date()
        counter.save(HistoryEntry(count: counter.count, date: formatter.string(from: date)))
        updateDisplayableHistoryFormat()
    }

    func onCleanHistory(){
        counter.cleanTable()
        cleanDisplayableHistory()
    }

    private func updateDisplayableCounterFormat() {
        displayableCounter = "\(counter.count) steps"
    }

    private func updateDisplayableHistoryFormat() {
        cleanDisplayableHistory()
        for histo in counter.history {
            let convertToString: String = "Steps \(histo.count) and date: \(histo.date)"
            displayableHistory.append(convertToString)
        }
    }

    private func cleanDisplayableHistory(){
        displayableHistory.removeAll()
    }
}
