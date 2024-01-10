//
//  UnavailableView.swift
//  Instafilter
//
//  Created by Jeevan Mahtani on 10/1/24.
//

import SwiftUI

struct UnavailableView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create snippet") {
                
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    UnavailableView()
}
