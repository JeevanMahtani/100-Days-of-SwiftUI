//
//  Divider.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 12/12/23.
//

import SwiftUI

struct Divider: View {
    var body: some View {
            Rectangle()
                .frame(height: 4)
                .foregroundStyle(.white)
                .padding(.vertical)
    }
}

#Preview {
    Divider()
}
