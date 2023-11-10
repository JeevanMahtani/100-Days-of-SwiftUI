//
//  GestureView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 9/11/23.
//

import SwiftUI

struct ExperimentGestureView: View {
    @State private var scale1 = 1.0
    @State private var scale2 = 1.0
    @State private var scale3 = 1.0
    @State private var pressed = false
    @State private var color1 = Color(.yellow)
    @State private var color2 = Color(.red)
    var body: some View {
        VStack(spacing: 20) {
            LinearGradient(colors:[color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .scaleEffect(scale1)
                .onLongPressGesture(minimumDuration: .infinity,maximumDistance: 300, pressing: {
                    pressing in
                    pressed = pressing
                    if pressed { scale1 += 0.2; changeColor(Color.blue, Color.red) }
                    if !pressed { scale1 = 1.0; changeColor(Color.yellow, Color.red); }
                }, perform: {
                    pressed.toggle()
                    
                })
                .animation(.spring(.snappy, blendDuration: 3))
            
            LinearGradient(colors:[color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .scaleEffect(scale2)
                .onLongPressGesture(minimumDuration: .infinity,maximumDistance: 300, pressing: {
                    pressing in
                    pressed = pressing
                    if pressed { scale2 += 0.2; changeColor(Color.black, Color.red) }
                    if !pressed { scale2 = 1.0; changeColor(Color.yellow, Color.red); }
                }, perform: {
                    pressed.toggle()
                    
                })
                .animation(.spring(.snappy, blendDuration: 3))

            LinearGradient(colors:[color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .scaleEffect(scale3)
                .onLongPressGesture(minimumDuration: .infinity,maximumDistance: 300, pressing: {
                    pressing in
                    pressed = pressing
                    if pressed { scale3 += 0.2; changeColor(Color.blue, Color.red) }
                    if !pressed { scale3 = 1.0; changeColor(Color.yellow, Color.red); }
                }, perform: {
                    pressed.toggle()
                    
                })
                .animation(.spring(.snappy, blendDuration: 3))
        }
    }
    func changeColor(_ c1: Color, _ c2: Color) {
        color1 = c1
        color2 = c2
    }
}

#Preview {
    ExperimentGestureView()
}
