//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 10/12/23.
//

import SwiftUI


struct HabitListView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading,spacing: 20) {
                VStack { 
                    Text(" Current Habbits")
                        .font(.title).bold()
                        .foregroundStyle(Color.white)
                }
                VStack {
                    List {
                        ForEach(0..<8) { num in
                            HStack {
                                Image(systemName: "x.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                VStack(alignment: .leading) {   
                                    Text("Habit \(num)")
                                        .bold()
                                    Text("Kick")
                                } 
                               
                                
                            }   
                        }
                    }
                    .frame(width: geometry.size.width * 0.9)
                    .listStyle(.plain)
                    .environment(\.defaultMinListRowHeight, 50)
                    
                    .listRowInsets(EdgeInsets())
                }
                
                // .border(.blue, width: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.pleasantOrange)
            // .border(.red, width: 5)
        }   
        
    }
}

#Preview {
    HabitListView()
}
