//
//  DateManager.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import Foundation

struct DateManager {
    static var currentDateAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yy HH:mm" 
        return dateFormatter.string(from: Date())
    }
}
