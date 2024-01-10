//
//  ContentView.swift
//  Instafilter
//
//  Created by Jeevan Mahtani on 8/1/24.
//

import SwiftUI

struct ContentView: View {    
    @State private var blurAmount = 0.0 
    @State private var showingDialog = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        VStack {
            Text("Hello")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                        print("New value is \(newValue)")
                }
                .onChange(of: blurAmount) { 
                        print("New value")
                }
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 1...20)
            }
            
            Button("Hello") {
                showingDialog.toggle()
            }
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .confirmationDialog("Change Background", isPresented: $showingDialog) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color.")
            }
        }
    }
}

#Preview {
    ContentView()
}
