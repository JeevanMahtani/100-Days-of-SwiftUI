//
//  AddViewChalllengeView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 8/12/23.
//

import SwiftUI

struct AddViewChalllengeView: View {
    @State private var name = "New Expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {      
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newExpense = Expense(name: name, type: type, amount: amount)
                        
                        modelContext.insert(newExpense)
                        
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    AddViewChalllengeView()
}
