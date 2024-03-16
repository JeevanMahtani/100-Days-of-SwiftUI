//
//  ContentView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 9/3/24.
//

import SwiftUI

struct CustomGestureView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")    
                .onTapGesture(count: 2, perform: {
                    print("Double tapped!")
                })              
                .onLongPressGesture(minimumDuration: 3) {
                    print("3 sec press")
                } onPressingChanged: { inProgress in
                    print("In progress: \(inProgress)")
                }
        }
        .padding()
    }
}

#Preview {
    CustomGestureView()
}
