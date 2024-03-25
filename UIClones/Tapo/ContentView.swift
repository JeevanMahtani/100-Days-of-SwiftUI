//
//  ContentView.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 21/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Cameras", systemImage: "camera.circle")
                }
            
            AddRobotView()
                .tabItem {
                    Label("Vacuums", systemImage: "soccerball.circle.inverse")
                }
            
            Text("Tab 4")
                .tabItem {
                    Label("Smart", systemImage: "cube")
                }
            
            Text("Tab 5")
                .tabItem {
                    Label("Me", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
