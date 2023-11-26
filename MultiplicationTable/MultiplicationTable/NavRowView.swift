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
    var body: some View {

        HStack {
            NavView(screen: screen1)
            Spacer().frame(width:5)
            NavView(screen: screen2)
        }
        .frame(width: 300)
    }
}



#Preview {
    NavView(screen: .test)
}
