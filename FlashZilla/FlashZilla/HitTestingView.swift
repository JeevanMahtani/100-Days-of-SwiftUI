//
//  HitTestingView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 9/3/24.
//

import SwiftUI

struct HitTestingView: View {
    var body: some View {
        VStack {
            Text("Hello")
            
            Spacer()
                .frame(height: 100)
            
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
        
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped")
//                }
//            
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Circle tapped")
//                }
//                //.allowsHitTesting(false)
//            
//        }
    }
}

#Preview {
    HitTestingView()
}
