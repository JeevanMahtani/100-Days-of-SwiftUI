//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 25/11/23.
//

import SwiftData
import Foundation

@Model
class Expense {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
