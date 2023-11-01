//
//  CompositionView.swift
//  ViewsAndModifiers
//
//  Created by Jeevan Mahtani on 30/10/23.
//

import SwiftUI


struct CapsuleView: View {
    var text: String = ""
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(.title)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}
struct CompositionView: View {
    var body: some View {
        VStack(spacing: 30) {
            CapsuleView(text: "One")
            CapsuleView(text: "Two")
            CapsuleView(text: "Three")
        }
    }
}

#Preview {
    CompositionView()
}
