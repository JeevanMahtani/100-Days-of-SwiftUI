//
//  ContentView.swift
//  BetterRest
//
//  Created by Jeevan Mahtani on 2/11/23.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount = 0.0
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    StepperView()
}
