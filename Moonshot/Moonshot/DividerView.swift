//
//  DividerView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 1/12/23.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
