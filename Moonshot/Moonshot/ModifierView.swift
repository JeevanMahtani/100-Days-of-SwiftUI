//
//  ModifierView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 30/11/23.
//

import SwiftUI

struct NameFont: ViewModifier {
    var position: String
    func body(content: Content) -> some View {
        let font: Font = position == "Commander" || position == "Command Pilot" ? .title2:
            .headline.bold()
        content
            .foregroundStyle(.white)
            .font(font)
    }
}


extension View {
    func fontStyle(for position: String) -> some View {
        modifier(NameFont(position: position))
    }
}
