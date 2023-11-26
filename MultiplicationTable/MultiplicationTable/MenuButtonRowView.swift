//
//  MenuButtonRowView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct MenuButtonRowView: View {
    var title1 = ""
    var title2 = ""
    var body: some View {
        HStack {
            MenuButtonView(title: title1)
            Spacer().frame(width:5)
            MenuButtonView(title: title2)
        }
        .frame(width: 300)
    }
}



#Preview {
    MenuButtonRowView(title1: "Item 1", title2: "Item 2")
}
