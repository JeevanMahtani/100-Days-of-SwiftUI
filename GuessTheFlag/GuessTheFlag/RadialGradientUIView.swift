//
//  RadialGradientUIView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct RadialGradientUIView: View {
    var body: some View {
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
    }
}

#Preview {
    RadialGradientUIView()
}
