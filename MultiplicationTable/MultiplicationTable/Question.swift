//
//  Question.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 21/11/23.
//

import Foundation
import Observation

struct Question {
    var question: String
    var answer: Int
}

@Observable
class Questions {
    var questions: [Question] = []
    var answers: [Int] = []
    var correctAnswer: Int = 0
    var score: Int = 0
    var questionNumber: Int = 1
    var numberOfQuestions: Int = 0
    var alertTitle: String = ""
    var alertMessage: String = ""

    
    init() {        
    }
    
    init(numberOfQuestions: Int, number: Int) {
        self.numberOfQuestions = numberOfQuestions
        for num in 1...numberOfQuestions {
            let question = Question(question: "\(number) X \(num)", answer: number * num)
            questions.append(question)
            questions.shuffle()
            correctAnswer = questions[0].answer
            generateAnswers()
        }        
    }
    
    deinit {
          // Cleanup logic
          print("Questions instance is being deallocated.")
        DispatchQueue.main.async { [weak self] in
            self?.reset()
        }
      }

      func reset() {
          questions = []
          answers = []
          correctAnswer = 0
          score = 0
          questionNumber = 1
          numberOfQuestions = 0
          alertTitle = ""
          alertMessage = ""
      }
    
    func endGame(scoreResult: Scores) {
        
        scoreResult.scores.insert(Score(correct: score, total: numberOfQuestions, date: scoreResult.currentDateTime()), at: 0)
        questionNumber = 1
        score = 0
    }
    
    func abortGame() {
        alertTitle = "New Game"
        alertMessage = "Abort current game?"
    }
    
    func nextQuestion() -> Bool {    
        var isGameOver = false
        if questions.count > 1 {
            questionNumber += 1
            questions.removeFirst()
            correctAnswer = questions[0].answer
            generateAnswers()
        } else {
            alertTitle = "Game over!"
            alertMessage = "You scored \(score)/\(numberOfQuestions)!"
            isGameOver = true
        }
        return isGameOver
    }
    
    func generateAnswers () {
        if !answers.isEmpty {
            answers.removeAll()
        }
        let incorrect1 = correctAnswer + 1
        let incorrect2 = correctAnswer - 1
        answers = [incorrect1, incorrect2, correctAnswer]
        answers.shuffle()
    }
    
    func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "Good Job!"
        } else {
            alertTitle = "Oops!"
            alertMessage = "That was incorrect. Correct answer is \(correctAnswer)"
        }
    }
    
    private func currentDateTime() -> String {
        let currentDate = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy HH:mm"
        
        return formatter.string(from: currentDate)
    }
}
