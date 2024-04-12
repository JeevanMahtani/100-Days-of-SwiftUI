//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 10/4/24.
//

import SwiftUI

@Observable
class Favourites {
    private var resorts: Set<String>
    private let key = "Favourites"
    
    init() {
        if let favouritedItems = UserDefaults.standard.data(forKey: key),
           let decodedItems = try? JSONDecoder().decode([String].self, from: favouritedItems) {
            resorts = Set(decodedItems)
        } else {
            resorts = [] 
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
