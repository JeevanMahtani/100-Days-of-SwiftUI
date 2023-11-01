//
//  GradientView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct GradientOneView: View {
    var body: some View {
        LinearGradient(stops:
                        [.init(color: .white, location: 0.15),
                         .init(color: .indigo, location: 0.85)
                        ], startPoint: .top, endPoint: .bottom)
    }
    
}

#Preview {
    GradientOneView()
}
