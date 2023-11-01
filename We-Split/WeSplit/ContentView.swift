//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeevan Mahtani on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    private var amountHeader = "Enter amount"
    
    var totalPerPerson: Double {
        let peopleCount = Double(numOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (tipSelection / 100) * checkAmount
        let totalAmount = tipValue + checkAmount
        return totalAmount / peopleCount
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(amountHeader) {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    
                    Picker("Diners", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)                
                }
                
                Section("Tip amount") {
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Amount per person") {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Grand total") {
                
                }

            }
            .navigationTitle("WeSplit")
            .toolbar { 
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
