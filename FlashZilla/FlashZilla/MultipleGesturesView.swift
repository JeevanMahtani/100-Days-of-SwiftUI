//
//  MultipleGesturesView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 9/3/24.
//

import SwiftUI

struct MultipleGesturesView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
         TapGesture()
            .onEnded {
                print("VStack tapped")
            })
//        .onTapGesture {
//            print("VStack tapped")
//        }
    }
}

#Preview {
    MultipleGesturesView()
}
