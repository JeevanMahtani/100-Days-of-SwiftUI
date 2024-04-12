//
//  OptionalSheetAlertDisplay.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 27/3/24.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct OptionalSheetAlertDisplay: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    var body: some View {
        Button("Tap me") {
            selectedUser = User()
            isShowingUser = true
        }
        // .sheet
        //        .alert(
        //            "Welcome",
        //            isPresented: $isShowingUser,
        //            presenting: selectedUser
        //        ) { user in
        //            Button(user.id) {
        //            }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    OptionalSheetAlertDisplay()
}
