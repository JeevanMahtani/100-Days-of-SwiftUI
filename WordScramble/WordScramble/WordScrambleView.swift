//
//  WordScrambleView.swift
//  WordScramble
//
//  Created by Jeevan Mahtani on 6/11/23.
//

import SwiftUI

struct WordScrambleView: View {
    @State private var usedWords =  [String]()
    @State private var enteredWord = ""
    @State private var rootWord = ""
    @State private var validWordCount = 0
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack { 
            VStack { 
                HStack {
                    Text("Valid Words: \(validWordCount)")
                    Text("Score: \(score)")
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                
                
                List {                    
                    Section {
                        TextField("Enter your word", text: $enteredWord)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Section {
                        ForEach(usedWords, id: \.self) { word in 
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                    
                }
                
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("OK") { }
                } message: {
                    Text(errorMessage)
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                Button("New Game", action: startGame)
            }
            
        }
    }
    
    func addNewWord() {
        let answer = enteredWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard wordAllowed(word: answer) else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible3(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognised", message: "You can't just make them up, you know!")
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
            enteredWord = ""
            validWordCount += 1
            score += answer.count
        }
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                validWordCount = 0
                score = 0
                enteredWord = ""
                if !usedWords.isEmpty {
                    usedWords.removeAll()
                }
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    
    func wordAllowed(word: String) -> Bool {
        var allowed = true
        if word == rootWord {
            errorMessage = "Can't use original word!"
            allowed = false
            
        } else if word.count < 3 {
            errorMessage = "Word too short! Minimum length is 3 characters"
            allowed =  false
        }
        
        if(!allowed) {
            errorTitle = "Word not allowed!"
            showingError = true
        } 
        return allowed
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible2(word: String) -> Bool {
        var exists = false
        for letter in word {
            if rootWord.contains(letter) {
                exists = true
            } else {
                exists = false
                break
            }
        }
        return exists
    }
    
    func isPossible3(word: String) -> Bool {
        var exists = true
        word.forEach { letter in
            if !rootWord.contains(letter) {
                exists = false
                return
            }
        }
        return exists
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0,length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    WordScrambleView()
}

