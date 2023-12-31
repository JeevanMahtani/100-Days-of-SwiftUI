//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jeevan Mahtani on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.red)
    }
}

#Preview {
    ContentView()
}
