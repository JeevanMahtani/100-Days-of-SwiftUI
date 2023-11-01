//
//  AlertViewUI.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct AlertViewUI: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show alert") {
            showAlert = true
        }
        .alert("Important message", isPresented: $showAlert) {
            Button("ok") {}
        }
        
        Button("Show alert") {
            showAlert = true
        }
        .alert("Important message", isPresented: $showAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Extra Message")
        }
    }
}

#Preview {
    AlertViewUI()
}
