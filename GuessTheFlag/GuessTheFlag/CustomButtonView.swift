//
//  CustomButtonView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        Button {
            print("Button tapped")
        } label: {
            Text("Custom Button")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
}

#Preview {
    CustomButtonView()
}
