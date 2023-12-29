//
//  TimePicker.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 29/12/23.
//

import SwiftUI

struct TimePicker: View {
    @Binding var habit: Habit
    
    var title: String
    var body: some View {
        
        VStack {
            HStack {
               Text(title)
                
                Spacer() 
                DatePicker("", selection: $habit.reminderTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .colorInvert()
                        .colorMultiply(Color.pleasantOrange)
            }
            .foregroundStyle( Color.pleasantOrange)
            .font(.title2.bold())
            .frame(width: .infinity, height: 60)    
            .padding(.horizontal)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke( Color.pleasantOrange, lineWidth: 3)
            )
            .animation(.bouncy)
    }
        
    }
}

#Preview {
    
    let description = """
        This is the description of the habit. This is some placeholder text to see how the habit description looks like. 
        """
  
    return TimePicker(habit: .constant(Habit(habitName: "Placeholder Habit Name", habitDescription: description, habitType: "Start", targetDays: 14)), title: "Select timing")
   
}
