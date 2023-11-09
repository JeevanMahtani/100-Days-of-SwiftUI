//
//  GestureView.swift
//  Animations
//
//  Created by Jeevan Mahtani on 9/11/23.
//

import SwiftUI

struct TextAnimationView: View {
    @State private var letters = Array("Hello SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
            )
    }
}

#Preview {
    TextAnimationView()
}
