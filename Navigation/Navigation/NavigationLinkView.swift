//
//  ContentView.swift
//  Navigation
//
//  Created by Jeevan Mahtani on 3/12/23.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}
struct NavigationLinkView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in 
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in 
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    NavigationLinkView()
}
