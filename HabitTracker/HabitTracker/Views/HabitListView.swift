//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftUI


struct HabitListView: View {
    @Binding var habits: Habits   
    @State private var isAddingRoutine = false
    
    var body: some View {
        NavigationStack {
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
                                NavigationLink(destination: HabitDetailView(habits: $habits, habit: $habits.habitList[habits.habitList.firstIndex(where: { $0.id == habit.id })!])) {
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
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.thickMaterial)
                                        .padding(
                                                  EdgeInsets(
                                                      top: 2,
                                                      leading: 10,
                                                      bottom: 2,
                                                      trailing: 10
                                                  )
                                              )
                                )
                            }
                            
                            .onDelete(perform: habits.removeHabit)
                        }
                        .scrollIndicators(.hidden)
                        .environment(\.colorScheme, .light)
                        .frame(width: geometry.size.width * 0.9)
                        .listStyle(.plain)
                       
                       
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pleasantOrange)
            }
            .sheet(isPresented: $isAddingRoutine) {
                AddHabitSheet(habits: habits)
                    .preferredColorScheme(.light)
            }
            .accentColor(.white)
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
}

#Preview {
    let habits = Habits()
    habits.habitList.append(Habit(habitName: "Test Habbit", habitDescription: "This is a test habbit description.", habitType: "Start", targetDays: 14))
    return HabitListView(habits: .constant(habits))
}
