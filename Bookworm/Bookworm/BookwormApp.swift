//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jeevan Mahtani on 26/12/23.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Book.self)
    }
}
