//
//  ExplicitAnimationView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 8/11/23.
//

import SwiftUI

struct ExplicitAnimationView: View {  
    @State private var colors  = [Color.red, Color.white, Color.green, Color.white, Color.yellow, Color.white] 
    @State private var animationAmounts  = [0.0, 0.0, 0.0]
    var body: some View {
        VStack(spacing: 40) {
            Button("Tap me") {
                withAnimation {
                    swapColor(0,1)
                    animationAmounts[0] += 180
                }
            }
            .padding(60)
            .background(colors[0])
            .font(.title)
            .foregroundStyle(colors[1])
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationAmounts[0])
                ,axis: (x: 0, y: 1, z: 0)
            )
            
            Button("Tap me") {
                withAnimation {
                    swapColor(2,3)
                    animationAmounts[1] += 180
                }
            }
            .padding(60)
            .background(colors[2])
            .font(.title)
            .foregroundStyle(colors[3])
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationAmounts[1])
                ,axis: (x: 0, y: 1, z: 0)
            )
            
            Button("Tap me") {
                withAnimation {
                    swapColor(4,5)
                    animationAmounts[2] += 180
                }
            }
            .padding(60)
            .background(colors[4])
            .font(.title)
            .foregroundStyle(colors[5])
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationAmounts[2])
                ,axis: (x: 0, y: 1, z: 0)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
    func swapColor(_ val1: Int, _ val2: Int) {
        colors.swapAt(val1,val2)
    }
}

#Preview {
    ExplicitAnimationView()
}
