//
//  AnimationViewsView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 9/11/23.
//

import SwiftUI

struct AnimationViewsView: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if(isShowingRed) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity)
                                )
            }
        }
    }
}

#Preview {
    AnimationViewsView()
}
