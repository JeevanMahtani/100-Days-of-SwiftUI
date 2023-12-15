//
//  UserDetailsview.swift
//  JSONPractice
//
//  Created by Jeevan Mahtani on 14/12/23.
//

import SwiftUI

struct UserDetailsView: View {
    var user: User
    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            VStack {             
                VStack {
                        Text(user.name)
                            .foregroundStyle(.white)
                            .font(.system(size: 45))
                            .bold()
                    
                    VStack(alignment: .leading) {
                        Text("City: \(user.city)")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                        
                        Text("Age: \(user.age)")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                        
                        HStack {
                            Text("Friends: ")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .bold()
                            ForEach(0..<user.friends.count) { _ in 
                                Image(systemName: "person")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18)).bold()                                
                            }                        
                        }
                    }
                }  
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           // .border(.red)
        }
    }
}

#Preview {
    let users: [User] = Bundle.main.decode("users.json")
    return UserDetailsView(user: users[4])
        
}
