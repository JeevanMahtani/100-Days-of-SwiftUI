//
//  RootViewNavigationView.swift
//  Navigation
//
//  Created by Jeevan Mahtani on 5/12/23.
//

import SwiftUI

struct ComplexDetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ComplexRootViewNavigationView: View {
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            ComplexDetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    ComplexDetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    RootViewNavigationView()
}
