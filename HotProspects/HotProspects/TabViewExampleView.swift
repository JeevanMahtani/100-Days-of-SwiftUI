//
//  TabViewExampleView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 13/2/24.
//

import SwiftUI

struct TabViewExampleView: View {
    @State private var selectedTab = "One"
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("One", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    TabViewExampleView()
}
