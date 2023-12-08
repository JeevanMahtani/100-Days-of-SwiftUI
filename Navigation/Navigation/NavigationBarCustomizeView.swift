//
//  NavigationBarCustomizeView.swift
//  Navigation
//
//  Created by Jeevan Mahtani on 7/12/23.
//

import SwiftUI

struct NavigationBarCustomizeView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            
        }
    }
}

#Preview {
    NavigationBarCustomizeView()
}
