//
//  CustomizeAnimationView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 8/11/23.
//

import SwiftUI

struct CustomizeAnimationView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1 ) * 3)
        //.animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
       /* .animation(
            .easeInOut(duration:2)
            .delay(1)
            , value: animationAmount) */
        .animation(
            .easeInOut(duration:2)
            .repeatForever(autoreverses: true)
            , value: animationAmount)
        
    }
}

#Preview {
    CustomizeAnimationView()
}
