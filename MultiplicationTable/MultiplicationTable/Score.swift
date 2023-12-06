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
    var date: String?
    

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
    
   func removeScore(at offsets: IndexSet) {
        self.scores.remove(atOffsets: offsets)
    }  
    
   func currentDateTime() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy HH:mm"        
        return formatter.string(from: currentDate)
    }
}
