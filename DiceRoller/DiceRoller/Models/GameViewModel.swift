//
//  File.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import Foundation

@Observable
class GameViewModel {
    var sides: Int
    var numOfDice: Int
    var firstDisplayedNumber: Int = 0
    var secondDisplayedNumber: Int = 0
    var date: Date
    var result: Int = 0
    
    init() {
        self.sides = 6
        self.numOfDice = 1
        self.date = Date()
        self.firstDisplayedNumber = Int.random(in: 1...6)
        self.secondDisplayedNumber = Int.random(in: 1...6)
        
    }
}
