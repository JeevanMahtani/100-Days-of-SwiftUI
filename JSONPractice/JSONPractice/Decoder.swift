//
//  Decoder.swift
//  JSONPractice
//
//  Created by Jeevan Mahtani on 14/12/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [User] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not load file")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load file")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedUsers = try? decoder.decode([User].self, from : data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loadedUsers
    }
}
