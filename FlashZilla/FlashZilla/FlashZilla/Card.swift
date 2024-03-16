//
//  Card.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 12/3/24.
//

import Foundation

struct Card: Codable, Identifiable {
    var id = UUID()
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
