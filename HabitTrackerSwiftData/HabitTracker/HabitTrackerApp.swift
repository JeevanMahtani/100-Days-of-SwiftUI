//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftData
import SwiftUI

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: Habit.self)
        }
    }
}
