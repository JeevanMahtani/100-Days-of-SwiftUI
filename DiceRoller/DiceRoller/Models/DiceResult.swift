//
//  DiceResult.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import Foundation
import SwiftData

@Model
class DiceResult: Identifiable {
    var uuid: UUID
    var result: Int
    var numOfDice: Int
    var rollDate: String
    
    init(result: Int, numOfDice: Int, rollDate: String) {
        self.uuid = UUID()
        self.result = result
        self.numOfDice = numOfDice
        self.rollDate = rollDate
    }
}

