//
//  ImageUIView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct ImageUIView: View {
    var body: some View {
        Image(systemName: "pencil.circle")
            .foregroundStyle(.red)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    ImageUIView()
}
