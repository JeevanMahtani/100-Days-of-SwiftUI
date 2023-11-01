//
//  ButtonImageView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct ButtonImageView: View {
    var body: some View {
        Button("Edit", systemImage: "pencil") {
            print("hey")
        }
    }
}

#Preview {
    ButtonImageView()
}
