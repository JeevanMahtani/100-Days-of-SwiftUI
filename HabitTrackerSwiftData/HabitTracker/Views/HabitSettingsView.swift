//
//  HabitSettingsView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 12/12/23.
//

import SwiftData
import SwiftUI

struct HabitSettingsView: View {
    @State private var reminderToggleState = false
    @State private var scheduleToggleState = false
    @State private var scheduleSetAlert = false
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentation
    
    @Bindable var habit: Habit

    var body: some View {
  
            VStack(spacing: 20) {                
                ZStack {
                    VStack(spacing: 20) {
                        
                        ToggleView(toggleState: $habit.hasDailyReminder, title: "Daily Reminder")
                    }  
                    .frame(width: .infinity)
                }
                .frame(width: .infinity, height: 90)
                .padding(.horizontal)
                .background(.thickMaterial)
                .preferredColorScheme(.light)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                if $habit.hasDailyReminder.wrappedValue {
                    ZStack {
                        VStack(spacing: 20) {
                            TimePicker(habit: habit, title: "Time")
                        }  
                        .frame(width: .infinity)       
                    }
                    .frame(width: .infinity, height: 90)
                    .padding(.horizontal)
                    .background(.thickMaterial)
                    .preferredColorScheme(.light)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    
                }
                
                Button(action: {
                   dismiss()
                }) {
                    Text("Close")
                        .font(.title2).bold()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .background(.thickMaterial)
                        .foregroundColor(Color.pleasantOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                        .environment(\.colorScheme, .light)
                }
                .opacity(1.0)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 20)
            .background(Color.pleasantOrange)
            .navigationBarBackButtonHidden()
            .alert(isPresented: $scheduleSetAlert) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("You have achieved your target, great job!"),
                    dismissButton: .default(Text("OK"))
                )
            }        
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Habit.self, configurations: config)
        
        let description = """
            This is the description of the habit. This is some placeholder text to see how the habit description looks like. 
            """
        
        let habit = Habit(habitName: "Test Habit", habitDescription: description, habitType: "Start", targetDays: 10)
        
        return HabitSettingsView(habit: habit)
            .modelContainer(container) 
        
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
