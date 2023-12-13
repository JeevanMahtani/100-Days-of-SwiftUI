//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 12/12/23.
//

import SwiftUI

struct HabitDetailView: View {
    @State private var targetCompleted = false
    
    @Environment(\.presentationMode) var presentation
    
    @Binding var habits: Habits
    
    var habit: Habit

    var body: some View {
        VStack(spacing: 20) {
            HStack {   
                Image(systemName: habit.habitIcon)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {
                        width, axis in width * 0.35
                    }
                    .padding(.top)
                    .foregroundStyle(.white)
                VStack(alignment: .leading, spacing: 15) { 
                    Text(isStarting(habit) ? "You've done this for..." : "You've stopped this for...")
                        .font(.system(size: 18))
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                    Text("\(habit.daysCompleted) \(habit.daysCompleted == 1 ? "day" : "days")")
                        .font(.system(size: 40))
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()                    
                }
                .padding(.leading, 10)
                
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing : 10) {
                
                VStack {
                    Text(habit.habitName)
                        .font(.title)
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 15)
                
                VStack {
                    Text(habit.habitDescription)
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                
                
                Divider()
                
                VStack {
                    Text("Target : \(habit.targetDays) days")
                        .font(.system(size: 30))
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
                
                
                
            }
            VStack {
                Button(action: {
                    incrementDaysCompleted(habit: habit, habits: habits)                    
                    if habit.daysCompleted == habit.targetDays {
                        targetCompleted = true
                    }
                }) {
                    Text("Completed today")
                        .font(.headline)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        .background(.thickMaterial)
                        .foregroundColor(Color.pleasantOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                        .environment(\.colorScheme, .light)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal)
        .background(Color.pleasantOrange)
        .navigationBarBackButtonHidden()
        .toolbar(content: {    
            ToolbarItem (placement: .navigation)  {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .bold()
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
            }
        })
        .alert(isPresented: $targetCompleted) {
            Alert(
                title: Text("Congratulations!"),
                message: Text("You have achieved your target, great job!"),
                dismissButton: .default(Text("OK"))
            )
        }        
    }
    
    private func isStarting(_ habit: Habit) -> Bool{
        habit.habbitType == "Start"
    }
    
    private func incrementDaysCompleted(habit: Habit, habits: Habits) {
        if let index =  habits.habitList.firstIndex(where: { $0.habitName == habit.habitName} ) {
            habits.habitList[index].daysCompleted += 1
        }
    }
    
}

    #Preview {
        
        let description = """
            This is the description of the habit. This is some placeholder text to see how the habit description looks like. 
            """
        return HabitDetailView(habits: .constant(Habits()), habit: Habit(habitName: "Placeholder Habit Name", habitDescription: description, habbitType: "Start", targetDays: 14))
}
