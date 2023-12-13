//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftUI


struct NoHabitsView: View {
    
    @State private var isAddingRoutine = false
    @Binding var habits: Habits
    
    var body: some View {
        VStack(alignment: .leading,spacing: 100) {
           
            Spacer()
            Spacer ()
        
            VStack(alignment: .leading) {
                Text("Hello.")
                    .preferredColorScheme(.light)
                    .font(.system(size: 45))
                    .foregroundStyle(.thickMaterial)
                    .bold()
            }
            .padding(.leading, 10)
            
            
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Wanna start a routine?")
                    .font(.system(size: 22))
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.pleasantOrange)
                    .bold()
                Text("Or perhaps stop some bad habits?")
                    .font(.system(size: 22))
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.pleasantOrange)
                    .bold()
                Text("Tap + to get started!")
                    .font(.system(size: 28))
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.pleasantOrange)
                    .bold()
            }
            .padding(.leading, 10)
            .padding(.vertical)
            .padding(.trailing)            
            .background(.thickMaterial)
            .environment(\.colorScheme, .light)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))    
         
            
           Spacer() 
            
            HStack {
    
                Spacer()
                Button(action: {
                    isAddingRoutine.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 70))
                        .foregroundStyle(Color.pleasantOrange)
                        .padding()
                        .background(.thickMaterial)
                        .environment(\.colorScheme, .light)
                        .clipShape(.circle)
                        
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                    
                    
                }
            }
            .frame(width: 350, height: 60)
            //.border(.blue, width: 5)
            
        Spacer()
        Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pleasantOrange)
        .ignoresSafeArea()
        .sheet(isPresented: $isAddingRoutine) {
            AddHabitSheet(habits: habits)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
                .preferredColorScheme(.light)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: 2)
        }
       // .border(.red, width: 5)
        
        
    }
}

#Preview {
    NoHabitsView(habits: .constant(Habits()))
}
