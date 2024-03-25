//
//  DiceRollerApp.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import SwiftUI
import SwiftData

@main
struct DiceRollerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: DiceResult.self)
        }
    }
}
