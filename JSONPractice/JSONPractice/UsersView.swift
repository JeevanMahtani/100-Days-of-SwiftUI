//
//  ContentView.swift
//  JSONPractice
//
//  Created by Jeevan Mahtani on 14/12/23.
//

import SwiftUI

struct UsersView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    let users: [User] = Bundle.main.decode("users.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.teal.ignoresSafeArea() 
                VStack {
                    VStack{    
                        Text("Users")
                            .padding(.horizontal, 19)
                            .foregroundStyle(.white)
                            .font(.system(size: 40))
                            .bold()
                    } .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(users) { user in
                                NavigationLink(destination: UserDetailsView(user: user))  {
                                    VStack(spacing: 0) {
                                        VStack(spacing: 0) {
                                            VStack(alignment: .leading) {
                                                Text(user.name)
                                                    .foregroundStyle(.teal)
                                                    .font(.system(size: 18))
                                                    .bold()
                                            }
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 50)
                                            .background(.white)
                                            .clipShape(
                                                .rect(
                                                    topLeadingRadius: 10,
                                                    bottomLeadingRadius: 0,
                                                    bottomTrailingRadius: 0,
                                                    topTrailingRadius: 10
                                                )
                                            )
                                            
                                            VStack(alignment: .leading) {
                                                
                                                Spacer()
                                                
                                                Text("Age: \(user.age)")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 16))
                                                    .bold()
                                                Text("Friends: \(user.friends.count)")
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 14))
                                                    .bold()
                                                
                                                Spacer()
                                                Spacer()
                                            }
                                            .frame(height: 90)
                                            .frame(maxWidth: .infinity)
                                            .background(.blue.opacity(0.35))
                                            .clipShape(
                                                .rect(
                                                    topLeadingRadius: 0,
                                                    bottomLeadingRadius: 10,
                                                    bottomTrailingRadius: 10,
                                                    topTrailingRadius: 0
                                                )
                                            )
                                        }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight:.infinity)
                                    .overlay(RoundedRectangle(cornerRadius:  10)
                                        .stroke(.white, lineWidth: 2)
                                    )
                                }
                            }
                        }                        
                    }
                    .padding(.horizontal)
                }
            }
        }        
    }    
}

#Preview {
    UsersView()
}
