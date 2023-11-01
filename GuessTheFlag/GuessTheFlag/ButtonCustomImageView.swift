//
//  ButtonCustomImageView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct ButtonCustomImageView: View {
    var body: some View {
        Button {
            print("Button")
        } label : {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
}

#Preview {
    ButtonCustomImageView()
}
