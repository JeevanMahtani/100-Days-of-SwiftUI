//
//  WeSplitChallengeView.swift
//  WeSplit
//
//  Created by Jeevan Mahtani on 25/10/23.
//

import SwiftUI

struct WeSplitChallengeView: View {
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    private var amountHeader = "Enter amount"
    
    var totalPerPerson: Double {
        return checkDetails.0 / checkDetails.1
    }
    
    var checkDetails: (Double, Double) {
        let peopleCount = Double(numOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (tipSelection / 100) * checkAmount
        return (tipValue + checkAmount, peopleCount)
    }
    
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
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Amount per person") {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Grand total") {
                    Text(checkDetails.0,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red: .black)
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
    WeSplitChallengeView()
}
