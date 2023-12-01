//
//  MenuButtonRowView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct NavRowView: View {
    var screen1: Screen
    var screen2: Screen
    var action: () -> Void
    var body: some View {

        HStack {
            NavView(screen: screen1) {
                action()
            }
            Spacer().frame(width:5)
            NavView(screen: screen2) {
                action()
            }
        }
        .frame(width: 300)
    }
}



#Preview {
    NavRowView(screen1: .test, screen2: .test, action: {})
}
