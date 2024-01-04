//
//  UserDefaultView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct UserDefaultView: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        Button("Tap Count \(tapCount)") {
            tapCount += 1
            
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

#Preview {
    UserDefaultView()
}
