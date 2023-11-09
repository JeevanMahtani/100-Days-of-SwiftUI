//
//  AnimationBindingView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 8/11/23.
//

import SwiftUI

struct AnimationBindingView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
        }  
        
        Spacer()
        
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(40)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
    
    }
}

#Preview {
    AnimationBindingView()
}
