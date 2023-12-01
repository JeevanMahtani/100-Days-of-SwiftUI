//
//  ExampleNavigationView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 27/11/23.
//

import SwiftUI

struct ExampleNavigationView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("Label 1")
                    Text("Label 2")
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ExampleNavigationView()
}
