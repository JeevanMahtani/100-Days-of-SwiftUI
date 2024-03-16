//
//  AccessibilityNeedsView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 10/3/24.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}
struct AccessibilityNeedsView: View {
  //  @Environment(\.accessibilityDifferentiateWithoutColor) var
   // accessibilityDifferentiateWithoutColor
//    @State private var scale = 1.0
//    @Environment(\.accessibilityReduceMotion) var
//    accessibilityReduceMotion
    
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency
    var body: some View {
        //        HStack {
        //            if accessibilityDifferentiateWithoutColor {
        //                Image(systemName: "checkmark.circle")
        //            }   
        //            Text("Success")
        //        } 
        //        .padding()
        //        .background(accessibilityDifferentiateWithoutColor ? .black : .green)
        //        .foregroundStyle(.white)
        //        .clipShape(.capsule)
        //    }
        
//        Button("Hello World") {
//            withOptionalAnimation {
//                scale *= 1.5
//            }
//        }
//        .scaleEffect(scale)
        
        Text("Hello world!")
            .padding()
            .background(accessibilityReduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    AccessibilityNeedsView()
}
