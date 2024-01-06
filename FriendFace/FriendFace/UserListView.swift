//
//  ContentView.swift
//  FriendFace
//
//  Created by Jeevan Mahtani on 6/1/24.
//

import SwiftUI

struct UserListView: View {
    @State private var users = [User]()
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
                    users = await userFetcher.retrieveUserData(into: users)
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView()
}
