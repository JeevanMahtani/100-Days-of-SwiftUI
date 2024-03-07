//
//  SwipeActionsView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 1/3/24.
//

import SwiftUI

struct SwipeActionsView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Delete")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
            
        }
    }
}

#Preview {
    SwipeActionsView()
}
