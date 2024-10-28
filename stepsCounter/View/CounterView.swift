//
//  CounterView.swift
//  stepsCounter
//
//  Created by Dylan Le Hir on 19/08/2024.
//

import SwiftUI

struct CounterView: View {
    @StateObject private var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            Text("Training Project - Steps Counter")
                .font(.title)
            Spacer()
            Text(viewModel.displayableCounter)
                .font(.title)
            HStack {
                Button(action: viewModel.onIncrementTap) {
                    Label("Up", systemImage: "plus.circle")
                        .padding(12)
                        .background(Color.yellow, in: RoundedRectangle(cornerRadius: 12))
                        .foregroundStyle(.black)
                }
                Button(action: viewModel.onResetTap) {
                    Label("Reset", systemImage: "minus.circle")
                        .padding(12)
                        .background(Color.red, in: RoundedRectangle(cornerRadius: 12))
                        .foregroundStyle(.black)
                }
                Button(action: viewModel.onSaveTap) {
                    Label("Save", systemImage: "clock.circle")
                        .padding(12)
                        .background(Color.green, in: RoundedRectangle(cornerRadius: 12))
                        .foregroundStyle(.black)
                }
            }
            Spacer()
            VStack {
                HStack {
                    Text("History")
                        .font(.title)
                    Spacer()
                    Button(action: viewModel.onCleanHistory) {
                        Label("Clean", systemImage: "xmark.bin.circle")
                            .padding(12)
                            .background(Color.black, in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                    }
                }.padding()
                ForEach(viewModel.displayableHistory, id: \.self) { history in
                    Text(history)
                }
            }
            .padding()
            .border(Color.black, width: 1)
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
}

#Preview {
    CounterView()
}
