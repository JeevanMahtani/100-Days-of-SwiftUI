//
//  ConditionalModifierView.swift
//  ViewsAndModifiers
//
//  Created by Jeevan Mahtani on 30/10/23.
//

import SwiftUI

struct ConditionalModifierView: View {
    @State private var userRedText = false
    var body: some View {
        Button("Change colour") {
            userRedText.toggle()
        }
        .foregroundStyle(userRedText ?.red: .blue)
    }
        
}

#Preview {
    ConditionalModifierView()
}
