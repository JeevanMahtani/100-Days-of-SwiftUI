//
//  ContentView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 13/2/24.
//

import SwiftUI

struct MultiSelectView: View {
    
    //@State private var selection: String?
    @State private var selection = Set<String>()
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    var body: some View {
        NavigationStack {
            List(users, id: \.self, selection: $selection) { user in
                Text(user)
            }
            .toolbar {
                EditButton()
            }
            
            if !selection.isEmpty {
                Text("You selected \(selection.formatted())")
            }
        }
        
    }
}

#Preview {
    MultiSelectView()
}
