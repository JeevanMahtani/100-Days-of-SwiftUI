//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 13/2/24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
