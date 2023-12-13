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
    let habbitType: String
    let targetDays: Int
    var daysCompleted: Int = 0
    
    var targetMet: Bool {
        daysCompleted == targetDays
    }
    
    var habitIcon : String {
        habbitType == "Start" ? "checkmark.circle" : "x.circle"
    }
    
    enum HabitType: String {
        case start = "Start"
        case stop = "Stop"
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




