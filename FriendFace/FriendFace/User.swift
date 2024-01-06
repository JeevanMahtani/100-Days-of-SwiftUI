//
//  User.swift
//  FriendFace
//
//  Created by Jeevan Mahtani on 6/1/24.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: String
    var name: String
}

struct User: Codable, Identifiable {
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    var status: String {
        isActive ? "Active" : "Inactive"
    }
    
    var displayedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = " dd MMM yyyy"
        return formatter.string(from: registered)
    }
    
}


