//
//  ListIdView.swift
//  WordScramble
//
//  Created by Jeevan Mahtani on 5/11/23.
//

import SwiftUI

struct ListIdView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List(people,id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    ListIdView()
}
