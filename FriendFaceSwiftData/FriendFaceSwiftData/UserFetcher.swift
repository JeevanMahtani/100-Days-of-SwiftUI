//
//  UserFetcher.swift
//  FriendFace
//
//  Created by Jeevan Mahtani on 6/1/24.
//

import Foundation

class UserFetcher {
    
    var url: String
    
    static let usersURL = "https://www.hackingwithswift.com/samples/friendface.json"
    
    init(url: String) {
        self.url = url
    }
    
    
    func retrieveUserData() async -> [User] {
        guard let url = URL(string: self.url) else {
            print("Invalid URL!")
            return [User]()
        }
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                return decodedResponse
            }
        } catch let error {
            print(error)
        }
        return [User]()
    }
}
