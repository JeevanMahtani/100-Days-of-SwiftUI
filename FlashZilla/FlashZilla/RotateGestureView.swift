//
//  RotateGestureView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 9/3/24.
//

import SwiftUI

struct RotateGestureView: View {
    @State private var currentAmount = Angle.zero   
    @State private var finalAmount = Angle.zero
    var body: some View {
        VStack {
            Text("Hello, world!")
                .rotationEffect(currentAmount + finalAmount)
                .gesture(
                    RotateGesture()
                        .onChanged { value in
                            currentAmount = value.rotation
                        }
                        .onEnded { value in
                            finalAmount += currentAmount
                            currentAmount = .zero
                        }
                )
            //                .onTapGesture(count: 2, perform: {
            //                    print("Double tapped!")
            //                })              
            //                .onLongPressGesture(minimumDuration: 3) {
            //                    print("3 sec press")
            //                } onPressingChanged: { inProgress in
            //                    print("In progress: \(inProgress)")
            //                }
        }
        .padding()
    }
}

#Preview {
    RotateGestureView()
}
