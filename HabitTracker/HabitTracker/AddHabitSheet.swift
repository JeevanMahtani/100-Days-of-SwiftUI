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
    
    @Environment(\.dismiss) var dismiss
    
    var habits: Habits
    	
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
                        
                   
                    
                        
                     /*   if reminderToggleState {
                            ToggleView(toggleState: $scheduleToggleState, title: "Set Timing")
                        }*/

                    }
                    .scrollContentBackground(.hidden)
                    
                    ZStack {
                      
                        VStack(spacing: 20) {
                         
                            
                            ToggleView(toggleState: $reminderToggleState, title: "Daily Reminder")
                            
                               if reminderToggleState {
                                   ToggleView(toggleState: $scheduleToggleState, title: "Set Timing")
                               }
                            
                            
                        }  
                        .frame(width: .infinity)

                    }
                    .frame(width: .infinity, height: reminderToggleState ? 160: 120)
                    .padding(.horizontal)
                    .background(.thickMaterial)
                    .preferredColorScheme(.light)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

  
                    
                }
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
                            let habit = Habit(habitName: habitName, habitDescription: habitDescription, habbitType: habitType, targetDays: targetDays)
                            habits.habitList.append(habit)
                            dismiss()
                        }) {
                            Text("Save")
                                .foregroundStyle(.white)
                                .font(.title3).bold()                       
                        }
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
