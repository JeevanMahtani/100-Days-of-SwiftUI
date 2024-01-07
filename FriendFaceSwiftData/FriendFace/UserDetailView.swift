//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Jeevan Mahtani on 6/1/24.
//

import SwiftUI

struct UserDetailView: View {
    
    var user: User
    var body: some View {
                
        VStack(spacing: 10) {
            VStack(alignment: .leading) {
                HStack {
                    Image(.placeholderdp)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    //    .border(.yellow)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(user.name)
                            .font(.title2)
                        Text(user.status)
                            .foregroundStyle(user.isActive ? .green : .red)
                            .bold()
                        Text("Age: \(user.age)")
                            
                        Text("Joined: \(user.displayedDate)")
                            .font(.subheadline)
                    }
                    .frame(width: 200,height: 150)
                   // .border(.yellow)
                   
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading)
           // .border(.black)
           
           DividerView()
                .padding(.horizontal)
           
            VStack(alignment: .leading, spacing: 30) {
                
                Text(user.company)
                Text(user.email)
                Text(user.address)
                Text(user.about)
                    .font(.system(size:12))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
          
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 310)
           // .border(.blue)
            
            DividerView()
            
                 .padding(.horizontal)
            VStack(alignment: .leading) { 
                Text("Friends(\(user.friends.count))")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.friends) { friend in
                            VStack {
                                Image(.placeholderdp)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                  //  .border(.yellow)
                                Text(friend.name)
                                    .font(.caption)
                                    .frame(width: 80) 
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
               // .border(.green)
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        //.border(.red)
    }
}

#Preview {
    let tags = ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5", "Tag 6"]
    let friend1 = Friend(id: "Id 1", name: "Friend 1")
    let friend2 = Friend(id: "Id 2", name: "Friend 2")
    let friend3 = Friend(id: "Id 3", name: "Friend 3")
    let friend4 = Friend(id: "Id 4", name: "Friend 4")
    let friend5 = Friend(id: "Id 5", name: "Friend 5")
    let friend6 = Friend(id: "Id 6", name: "Friend 6")
    let friend7 = Friend(id: "Id 7", name: "Friend 7")
    let friend8 = Friend(id: "Id 8", name: "Friend 8")
    
    let friends = 
    [friend1,friend2, friend3,
     friend4, friend5, friend6, friend7, friend8
    ]
    
    let about = """
Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.
"""
 

    return UserDetailView(user: User(id: "test id", isActive: true, name: "John Doe", age: 24, company: "ABC Company", email: "abc@gmail.com", address: "123 Abc Street, State, Country", about: about, registered: .now, tags: tags, friends: friends))
}
