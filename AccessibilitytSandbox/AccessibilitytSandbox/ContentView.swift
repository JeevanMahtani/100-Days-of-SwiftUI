//
//  ContentView.swift
//  AccessibilitytSandbox
//
//  Created by Jeevan Mahtani on 28/1/24.
//

import SwiftUI

struct ContentView: View {
    let pictures = ["ales-krivec-15949", "galina-n-189483","kevin-horstmann-141705","nicolas-tissot-335096"]
    
    let labels = [
    "Tulips",
    "Frozen tree buds",
    "Sunflowers",
    "Fireworks"
    ]
    @State private var selectedPicture = Int.random(in: 1...3)
    var body: some View {
       Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
}

#Preview {
    ContentView()
}
