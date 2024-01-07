//
//  ContentView.swift
//  FriendFace
//
//  Created by Jeevan Mahtani on 6/1/24.
//

import SwiftData
import SwiftUI

struct UserListView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    @State private var userFetcher = UserFetcher(url: UserFetcher.usersURL)
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title2)
                            HStack {
                                Text("Friends:")
                                Text("\(user.friends.count)")
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) { 
                            Text(user.status)
                                .bold()
                                .foregroundStyle(user.isActive ? .green : .red)
                        } 
                    }
                }
            }
            .task {
                if users.isEmpty {
                    let retrievedUsers = await userFetcher.retrieveUserData()
                    for user in retrievedUsers {
                        modelContext.insert(user)
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView()
}
