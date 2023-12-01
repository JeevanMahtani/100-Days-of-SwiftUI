//
//  ExpensesView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 25/11/23.
//

import SwiftUI

struct ExpensesView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var personalExpenses: [ExpenseItem] {
        return expenses.items.filter { $0.type == "Personal" }
    }
    
    var businessExpenses: [ExpenseItem] {
        return expenses.items.filter { $0.type == "Business" }
    }
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section(" Personal Expenses") {
                        ForEach(personalExpenses) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .listRowBackground(expenseStyle(amount: item.amount))
                            .foregroundColor(.white) 
                            
                        }
                        .onDelete(perform: { indexSet in
                            removeItems(at: indexSet,.personal)
                        })
                        
                    }
                    
                    Section("Business Expenses") {
                        ForEach(businessExpenses) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .listRowBackground(expenseStyle(amount: item.amount))
                            .foregroundColor(.white) 
                            
                        }
                        .onDelete(perform: { indexSet in
                            removeItems(at: indexSet, .business)
                        })
                    }
                }
                .navigationTitle("iExpense")
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            }  
        }
    }
    
    func removeItems(at offsets: IndexSet, _ type: ExpenseType) {
        let selectedExpenses = type == .business ? businessExpenses: personalExpenses
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: {$0.id == selectedExpenses[offset].id}) {
                expenses.items.remove(at: index)
            }
        }
    }
    
    func expenseStyle(amount: Double) -> Color {
        if amount < 10.0 {
            return Style.green.color
        } else if amount < 100.0 {
            return Style.yellow.color
        } else {
            return Style.red.color
        }
    }
}

enum Style {
    case green, yellow, red
    
    var color: Color {
        switch(self) {
        case .green: return Color.green
        case .yellow: return Color.yellow   
        case .red: return Color.red
        }
    }
}

enum ExpenseType: String {
    case business, personal 
}

#Preview {
    ExpensesView()
}
