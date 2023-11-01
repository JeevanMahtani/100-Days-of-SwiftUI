//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    let numberOfItems = 4
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                Color.red
                Color.white
            } 
            VStack(spacing: 20) {
                ForEach(1..<numberOfItems + 1, id: \.self) { index in
                    Text("Your Content \(index)")
                        .foregroundStyle(.secondary)
                        .padding(50)
                        .background(.ultraThinMaterial)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
