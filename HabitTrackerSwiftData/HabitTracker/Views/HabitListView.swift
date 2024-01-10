//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftData
import SwiftUI

struct HabitListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
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
                            ForEach(habits) { habit in
                                NavigationLink(destination: HabitDetailView(habit: habit)) {
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
                            .onDelete(perform: deleteHabit)
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
                AddHabitSheet()
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
    func deleteHabit(at offsets: IndexSet) {
        for offset in offsets {
            let habit = habits[offset]
            modelContext.delete(habit)
        }
    }
}

#Preview {
    HabitListView()
}
