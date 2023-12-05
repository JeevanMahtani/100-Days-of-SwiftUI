//
//  Score.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 4/12/23.
//

import Foundation


struct Score: Identifiable, Codable {
    var id = UUID()
    var correct: Int
    var total: Int
}

@Observable
class Scores {
    var scores: [Score] {
        didSet {
            if let encoded = try? JSONEncoder().encode(scores) {
                UserDefaults.standard.set(encoded, forKey: "Scores")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Scores") {
            if let decodedItems = try? JSONDecoder().decode([Score].self, from: savedItems) {
                scores = decodedItems
                return
            }
        }
        scores = []
    }
}
