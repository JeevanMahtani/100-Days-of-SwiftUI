//
//  ExpensesNavigationView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 8/12/23.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]

    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ]
    
    @State private var showExpenseFilters = false
    @State private var showBusinessExpenses = false
    
    var filterType: String {
        if showBusinessExpenses {
            return "Business"
        } else {
            return "Personal"
        }
    }

    var body: some View {
        VStack {
            NavigationStack {
                ExpensesView(expenseType: showExpenseFilters ? filterType : "All" , sortOrder: sortOrder)
                    .navigationTitle("iExpense")
                    .toolbar {
                        
                        Button(showExpenseFilters ? "All": "Filters") {
                            showExpenseFilters.toggle()
                        }
                        
                        if showExpenseFilters {
                            Button(showBusinessExpenses ? "Show Personal" : "Show Business") {
                                showBusinessExpenses.toggle()
                            }
                        }
                        
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by name")
                                .tag([
                                    SortDescriptor(\Expense.name),
                                    SortDescriptor(\Expense.amount)
                                ])
                            
                            Text("Sort by amount")
                                .tag([
                                    SortDescriptor(\Expense.amount),
                                    SortDescriptor(\Expense.name)
                                ])
                        }
                    }
                    NavigationLink(destination: AddViewChalllengeView()) {
                        Image(systemName: "plus")
                    }
                    

                }
            } 
        }
    }
}

func expenseStyle(amount: Double) -> Color {
    if amount < 10.0 {
        return Color.green
    } else if amount < 100.0 {
        return Color.yellow
    } else {
        return Color.red
    }
}

#Preview {
    HomeView()
}
