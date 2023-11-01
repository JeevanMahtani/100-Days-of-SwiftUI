//
//  NamePickerView.swift
//  WeSplit
//
//  Created by Jeevan Mahtani on 23/10/23.
//

import SwiftUI

struct NamePickerView: View {
    let names = ["User A", "User B", "User C"]
    @State private var selected = ""
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select user", selection: $selected) {
                    ForEach(names, id: \.self) {
                        Text($0)
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle("Select a user")
        }
    }
}

#Preview {
    NamePickerView()
}
