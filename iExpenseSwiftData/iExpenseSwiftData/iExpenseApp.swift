//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: Expense.self)
        }
    }
}
