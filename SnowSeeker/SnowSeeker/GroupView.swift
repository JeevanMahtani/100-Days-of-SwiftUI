//
//  GroupView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 27/3/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
         if horizontalSizeClass == .compact {
             VStack(content: UserView.init) 
         } else {
             HStack(content: UserView.init) 
         }
     }
}

#Preview {
    GroupView()
}
