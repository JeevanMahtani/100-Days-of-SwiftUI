//
//  ExpensesView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 4/1/24.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    var body: some View {
        List {
            Section("Expenses") {
                ForEach(expenses) { expense in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)
                            
                            Text(expense.type)
                        }
                        
                        Spacer()
                        
                        Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .listRowBackground(expenseStyle(amount: expense.amount))
                    .foregroundColor(.white) 
                    .accessibilityElement()
                    .accessibilityValue("\(expense.name) \(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .accessibilityHint("\(expense.type) expense")
                    
                }
                .onDelete(perform: { indexSet in
                    deleteExpense(at: indexSet)
                })
                
            }
            
        }
        
    }
    func deleteExpense(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
    
    init(expenseType: String, sortOrder: [SortDescriptor<Expense>]) {        
        if (expenseType == "Personal" || expenseType == "Business") {
            _expenses = Query(filter: #Predicate<Expense> { expense in
                expense.type == expenseType 
            }, sort: sortOrder)
        } else {
            _expenses = Query(sort: sortOrder)
        }        
    }
}

#Preview {
    ExpensesView(expenseType: "Personal", sortOrder: [SortDescriptor(\Expense.name)])
        .modelContainer(for: Expense.self)
}
