//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 31/3/24.
//

import SwiftUI

struct SearchableView: View {
    
    @State private var searchText =  ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { name in
                name.localizedStandardContains(searchText)    
            }
        }
    }
    
    var body: some View {
            NavigationStack {
                List(filteredNames, id: \.self) { name in
                    Text(name)
                }
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
            }
        }

}

#Preview {
    SearchableView()
}
