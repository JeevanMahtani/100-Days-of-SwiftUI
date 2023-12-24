//
//  ToggleView.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 13/12/23.
//

import SwiftUI

struct ToggleView: View {
    @Binding var toggleState: Bool
    var title = "Toggle Title"
    var body: some View {

            VStack {
                HStack {
                   Text(title)
                    Toggle("",isOn: $toggleState)
                        .toggleStyle(SwitchToggleStyle(tint: Color.pleasantOrange))
                }
                .foregroundStyle(toggleState ? Color.pleasantOrange : Color.gray)
                .font(.title2.bold())
                .frame(width: 300, height: 60)                
                .padding(.horizontal)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(toggleState ? Color.pleasantOrange: Color.gray, lineWidth: 3)
                )
                

        }
    }
}

#Preview {
    ToggleView(toggleState: .constant(false))
}
