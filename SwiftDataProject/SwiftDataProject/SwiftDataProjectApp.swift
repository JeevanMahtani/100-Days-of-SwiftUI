//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Jeevan Mahtani on 31/12/23.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: User.self)
        }
    }
}
