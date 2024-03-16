//
//  TimerPublisherView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 10/3/24.
//

import SwiftUI

struct TimerPublisherView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in 
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is no \(time)")
                }
                
                counter += 1
            }
    }
}

#Preview {
    TimerPublisherView()
}
