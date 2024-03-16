//
//  SequentialGesturesView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 9/3/24.
//

import SwiftUI

struct SequentialGesturesView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }   
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in 
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined	)
    }
}

#Preview {
    SequentialGesturesView()
}
