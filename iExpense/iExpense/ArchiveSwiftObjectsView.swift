//
//  ArchiveSwiftObjectsView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct Users: Codable {
    let firstName: String
    let lastname: String
}

struct ArchiveSwiftObjectsView: View {
    @State private var user = Users(firstName: "Taylor", lastname: "Swift")
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchiveSwiftObjectsView()
}
