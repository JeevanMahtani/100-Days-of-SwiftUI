//
//  AnimationStackView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 9/11/23.
//

import SwiftUI

struct AnimationStackView: View {
    @State private var enabled = false
    var body: some View {
        Button("Tap Me!") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
    
        .foregroundColor(.white)
       // .animation(.default, value: enabled)
        .animation(nil, value: enabled)
        .font(.title)
        .clipShape(.rect(cornerRadius: enabled ? 60: 0))
        .animation(.spring(duration:1, bounce: 0.6), value: enabled)
        .background(enabled ? .blue: .red)
        
    }
}

#Preview {
    AnimationStackView()
}
