//
//  ListNavigationView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 27/11/23.
//

import SwiftUI

struct ListNavigationView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in 
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
        }
    }
}

#Preview {
    ListNavigationView()
}
