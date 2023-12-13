//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftUI


struct ListView: View {
    @State private var habits = Habits()    
    @State private var isAddingRoutine = false
    
    var body: some View {
            GeometryReader { geometry in
                VStack(alignment: .leading,spacing: 20) {
                    VStack { 
                        Text(" Current Habits")
                            .fontDesign(.rounded)
                            .font(.system(size: 35))
                            .bold()
                            .foregroundStyle(Color.white)
                    }
                    VStack {
                        List {
                            ForEach(habits.habitList) { habit in
                                NavigationLink(destination: EmptyView()) {
                                HStack {
                                    Image(systemName: habit.habitIcon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                    VStack(alignment: .leading) {   
                                        Text("\(habit.habitName)")
                                            .fontDesign(.rounded)
                                            .font(.system(size: 24))
                                            .bold()
                                        Text("\(habit.habitDescription)")
                                            .font(.system(size: 18))
                                      } 
                                   }
                                .frame(height: 75)
                                    
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.thickMaterial)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.pleasantOrange, lineWidth: 10)
                                        )
                                )
                            }
                            .onDelete(perform: habits.removeHabit)
                        }
                        .frame(width: geometry.size.width * 0.9)
                        .listStyle(.plain)
                       
                        .environment(\.defaultMinListRowHeight, 60)
                        
                       // .listRowInsets(EdgeInsets())
                    }
                    
                    // .border(.blue, width: 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pleasantOrange)
                // .border(.red, width: 5)
            }  
            .sheet(isPresented: $isAddingRoutine) {
                AddHabitSheet(habits: habits)
            }
            .toolbar {
                Button(action: {
                    isAddingRoutine.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        
        
    }
}

#Preview {
    ListView()
}

