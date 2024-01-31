//
//  AccessibilityInputView.swift
//  AccessibilitytSandbox
//
//  Created by Jeevan Mahtani on 29/1/24.
//

import SwiftUI

struct AccessibilityInputView: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    AccessibilityInputView()
}
