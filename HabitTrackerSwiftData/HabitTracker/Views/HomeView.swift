//
//  HomeView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 11/12/23.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    var body: some View {
        NavigationStack{
            if habits.isEmpty {
                NoHabitsView()
            } else {
                HabitListView()
            }
        }
    }
}

#Preview {
    HomeView()
}

