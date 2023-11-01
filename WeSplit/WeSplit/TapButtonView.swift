//
//  TapButtonView.swift
//  WeSplit
//
//  Created by Jeevan Mahtani on 23/10/23.
//

import SwiftUI

struct TapButtonView: View {
    @State private var tapCount = 0
    var body: some View {
        
        Button("Tap count: \(tapCount)") {
            tapCount+=1
        }
    }
}

#Preview {
    TapButtonView()
}
