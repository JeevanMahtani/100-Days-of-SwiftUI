//
//  SwiftUIView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct GradientTwoView: View {
    var body: some View {
        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    GradientTwoView()
}
