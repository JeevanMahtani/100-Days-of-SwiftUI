//
//  OverlayView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 8/11/23.
//

import SwiftUI

struct OverlayView: View {
    @State private var animationAmount = 2.0
    var body: some View {
        Button("Tap Me") {
            //animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
        Circle()
            .stroke(.red)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(
                .easeInOut(duration:1)
                .repeatForever(autoreverses: false)
                , value: animationAmount)
            
        )
        .onAppear {
            animationAmount = 2
        }
       
    }
}

#Preview {
    OverlayView()
}
