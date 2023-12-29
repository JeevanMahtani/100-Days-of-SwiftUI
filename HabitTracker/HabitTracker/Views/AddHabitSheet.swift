//
//  AddHabitSheet.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftUI


struct AddHabitSheet: View {
    
    @State private var habitName: String = ""
    @State private var habitType = "Start"
    @State private var types = ["Start", "Stop"]
    @State private var habitDescription: String = ""
    @State private var targetDays: Int = 1
    
    @State private var reminderToggleState = false
    @State private var scheduleToggleState = false
    
    @State private var triggerSuccess = false
    
    @Environment(\.dismiss) var dismiss
    
    var habits: Habits
    
    var validHabit: Bool {
        if habitName.isEmpty || habitDescription.isEmpty {
            return false
        }
        return true
    }
    	
    var body: some View {
        
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    Form {
                        Section {
                            TextField("Example: Learn Acoustic Guitar", text: $habitName)
                                .padding(.vertical, 6)
                        }
                                
                            Group {
                                TextField("Example: My aim is to learn how to play a new chord everyday so I can learn all chords of the C Major scale in 2 weeks and start playing some songs!", text: $habitDescription,  axis: .vertical)
                                    .lineLimit(4...4)
                            }
                            
                        Section(header:
                                    VStack(alignment: .leading) { 
                            Text("Stop or start doing?")
                                .padding(.trailing, 50)
                                .foregroundStyle(.white)
                                .bold()
                            
                        }){
                            Picker("Start or stop doing?", selection: $habitType) {
                                ForEach(types, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section(header:
                                    VStack(alignment: .leading) { 
                            Text("Target days")
                                .padding(.trailing, 50)
                                .foregroundStyle(.white)
                                .bold()
                            
                        })  {
                            Stepper("\(targetDays.formatted())", value: $targetDays, in: 1...100, step: 1)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                .scrollBounceBehavior(.basedOnSize)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pleasantOrange)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {     
                    ToolbarItem(placement: .principal) {
                        Text("New Routine")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            let habit = Habit(habitName: habitName, habitDescription: habitDescription, habitType: habitType, targetDays: targetDays)
                            habits.habitList.append(habit)
                            triggerSuccess.toggle()
                            dismiss()
                        }) {
                            Text("Save")
                                .foregroundStyle(.white)
                                .font(.title3).bold()                       
                        }
                        .sensoryFeedback(.success, trigger: triggerSuccess)
                        .disabled(validHabit == false)
                        .opacity(validHabit == false ? 0.5: 1)
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Cancel")
                                .foregroundStyle(.white)
                                .font(.title3).bold()                       
                        }
                    }
                }                
            }
        }
    }
}

#Preview {
    AddHabitSheet(habits: Habits())
}
