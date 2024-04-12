//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 5/4/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome to SnowSeeker")
            .font(.largeTitle)
        
        Text("Please select a reosrt form the left-hand menu; swipe from the edge to show it.")
            .foregroundStyle(.secondary)
    }
}

#Preview {
    WelcomeView()
}
