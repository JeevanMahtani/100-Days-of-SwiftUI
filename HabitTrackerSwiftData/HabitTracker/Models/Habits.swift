//
//  Habits.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 11/12/23.
//

import SwiftData
import Foundation

@Model
class Habit: Identifiable, Equatable {
    var id = UUID()
    let habitName: String
    let habitDescription: String
    let habitType: String
    let targetDays: Int
    var daysCompleted: Int = 0
    var buttonDisabled = false
    var hasDailyReminder = false
    var reminderTime: Date
    
    init(habitName: String, habitDescription: String, habitType: String, targetDays: Int) {
        self.habitName = habitName
        self.habitDescription = habitDescription
        self.habitType = habitType
        self.targetDays = targetDays
        
        // Set default reminder time to 12:00 PM
        var components = DateComponents()
        components.hour = 12
        components.minute = 0
        
        if let date = Calendar.current.date(from: components) {
            self.reminderTime = date
        } else {
            self.reminderTime = Date()
        }
    }
    
    var targetMet: Bool {
        daysCompleted == targetDays
    }
    
    var habitIcon : String {
        habitType == "Start" ? "checkmark.circle" : "x.circle"
    }
    
   // func removeHabit(at offsets: IndexSet) {
    //    self.habitList.remove(atOffsets: offsets)
   // }  
    

    
    func targetMetFor(_ habit: Habit) -> Bool {
        habit.targetDays == habit.daysCompleted
    }
}





