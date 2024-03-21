//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Jeevan Mahtani on 17/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Live long and prosper")
//            .frame(width: 300, height: 300, alignment: .topLeading)
//            .border(.red)
        
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("Long")
            Text("And")
                .font(.title)
            
            Text("Prosper")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ContentView()
}
