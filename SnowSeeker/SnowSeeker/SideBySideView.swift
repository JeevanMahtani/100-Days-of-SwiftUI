//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 27/3/24.
//

import SwiftUI

struct SideBySideView: View {
    var body: some View {
        NavigationSplitView {
            NavigationLink("Primary") {
                Text("New View")
            }
        } detail: {
            Text("Content")  
                .toolbar(.hidden, for: .navigationBar)
              
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    SideBySideView()
}
