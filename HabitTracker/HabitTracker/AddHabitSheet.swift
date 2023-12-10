//
//  AddHabitSheet.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftUI

struct AddHabitSheet: View {
    @State private var habitName: String = ""
    @State private var habitType = 0
    @State private var habitDescription: String = ""
    @State private var targetDays: Int = 1
    
    @Environment(\.dismiss) var dismiss
    	
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
                                TextField("Example: My aim is to learn how to play a new chord everyday so I can learn all chords of the C Major in 2 weeks and start playing some songs!", text: $habitDescription,  axis: .vertical)
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
                                Text("\(HabitType.start.rawValue)").tag(0)
                                Text("\(HabitType.stop.rawValue)").tag(1)
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pleasantOrange)
                .navigationTitle("New Routine")
                .navigationBarColor(backgroundColor: .clear, titleColor: .white)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {
                            dismiss()
                            //TODO: Save new routine into list of routines
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
    AddHabitSheet()
}

extension AddHabitSheet {
    
    enum HabitType: String {
        case start = "Start"
        case stop = "Stop"
    }
}
