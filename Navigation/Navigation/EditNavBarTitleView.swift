//
//  EditNavBarTitleView.swift
//  Navigation
//
//  Created by Jeevan Mahtani on 7/12/23.
//

import SwiftUI

struct EditNavBarTitleView: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
       
    }
}

#Preview {
    EditNavBarTitleView()
}
