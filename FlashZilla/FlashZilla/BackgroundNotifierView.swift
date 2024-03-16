//
//  BackgroundNotifierView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 10/3/24.
//

import SwiftUI

struct BackgroundNotifierView: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    BackgroundNotifierView()
}
