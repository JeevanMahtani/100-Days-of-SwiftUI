//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Jeevan Mahtani on 6/1/24.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
                .modelContainer(for: User.self)
        }
    }
}
