//
//  HomeView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    @State private var habits = Habits()
    var body: some View {
        NavigationStack{
            if habits.habitList.isEmpty {
                NoHabitsView(habits: $habits)
            } else {
                HabitListView(habits: $habits)
            }
        }
    }
}

#Preview {
    HomeView()
}
