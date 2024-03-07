//
//  ContentView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 3/3/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @State private var sortOrder = [
        SortDescriptor(\Prospect.name),
        SortDescriptor(\Prospect.name, order: .reverse)]
    
    var body: some View {
            TabView {
                ProspectsView(filter: .none, sortOrder: $sortOrder)
                    .tabItem {
                        Label("Everyone", systemImage: "person.3")
                    }
                
                ProspectsView(filter: .contacted, sortOrder: $sortOrder)
                    .tabItem {
                        Label("Contacted", systemImage: "checkmark.circle")
                    }
                
                ProspectsView(filter: .uncontacted, sortOrder: $sortOrder)
                    .tabItem {
                        Label("Uncontacted", systemImage: "questionmark.diamond")
                    }
                
                MeView()
                    .tabItem {
                        Label("Me", systemImage: "person.crop.square")
                    }
            }
    }
}
    #Preview {
    ContentView()
}
