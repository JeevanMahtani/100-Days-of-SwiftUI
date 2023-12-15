//
//  Person.swift
//  JSONPractice
//
//  Created by Jeevan Mahtani on 14/12/23.
//

import Foundation


struct User: Codable, Identifiable {
    let id: Int
    var name: String
    var city: String
    var age: Int
    var friends: [Friend]
    
    struct Friend: Codable {
        var name: String
        var hobbies: [String]
    }
}




