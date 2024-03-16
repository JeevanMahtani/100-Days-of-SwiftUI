//
//  CardViewModel.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 16/3/24.
//

import Foundation

@Observable
class CardViewModel {
    private(set) var cards: [Card]
    var newPrompt = ""
    var newAnswer = ""
    let savePath = URL.documentsDirectory.appending(path: "SavedCards")
    
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            cards = try JSONDecoder().decode([Card].self, from: data)
        } catch {
            cards = []
        }
    }
    
    func loadData() {
        do {
            let data = try Data(contentsOf: savePath)
            cards = try JSONDecoder().decode([Card].self, from: data)
        } catch {
            cards = []
        }
    }
    
    
    func saveData() {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to:savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
        
        guard newPrompt.isEmpty && newAnswer.isEmpty else {
            newPrompt = ""
            newAnswer = ""
            return
        }
    }
    
    func removeCards(at offset: IndexSet) {
        cards.remove(atOffsets: offset)
        saveData()
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    
    func insertCard(_ newCard: Card, at index: Int) {
        cards.insert(newCard, at: index)

    }
}
