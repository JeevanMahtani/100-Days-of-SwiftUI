//
//  Habits.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 11/12/23.
//

import Foundation


struct Habit: Identifiable, Codable, Equatable {
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
    
    var defaultTime: Date {
        defaultTiming()
    }
    
    var targetMet: Bool {
        daysCompleted == targetDays
    }
    
    var habitIcon : String {
        habitType == "Start" ? "checkmark.circle" : "x.circle"
    }
    
    enum HabitType: String {
        case start = "Start"
        case stop = "Stop"
    }
    
    private func defaultTiming() -> Date {
        var components = DateComponents()
        components.hour = 12
        components.minute = 0
        components.second = 0

        let calendar = Calendar.current

        let currentDate = Date()

        if let dateWith12PM = calendar.date(bySettingHour: components.hour!, minute: components.minute!, second: components.second!, of: currentDate) {
            return dateWith12PM
        } else {
            print("Error creating date with 12 PM")
            return currentDate
        }
    }
}

@Observable
class Habits {
    var habitList = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habitList) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habitList = decodedItems
                return
            }
        }        
        habitList = []
    }
    
    func removeHabit(at offsets: IndexSet) {
         self.habitList.remove(atOffsets: offsets)
     }  
    
    func targetMetFor(_ habit: Habit) -> Bool {
        habit.targetDays == habit.daysCompleted
    }
}




