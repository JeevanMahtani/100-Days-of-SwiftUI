//
//  AngularGradientView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct AngularGradientView: View {
    var body: some View {
        AngularGradient(colors: [.red,.yellow,.green,.blue,.purple,.red], center: .center)
    }
}

#Preview {
    AngularGradientView()
}
