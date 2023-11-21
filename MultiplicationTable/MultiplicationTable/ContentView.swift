//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numOfQuestions = 5
    @State private var numberMultiplication = 1
    @State private var isNotActive = false
    @State private var questions: [Question] = []
    @State private var answers: [Int] = []
    @State private var correctAnswer = 0
    @State private var currentQuestionPosition = 0
    @State private var questionNumber = 1
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var resultAlert =  false
    @State private var gameOverAlert =  false
    @State private var newGameAlert = false
    
    var body: some View {
        if(!isNotActive) {
            Form {
                
                Text("Multiplication Table")
                
                Section("Select a number from 1 to 12") {
                    Stepper("\(numberMultiplication.formatted())", value: $numberMultiplication, in: 1...12, step: 1)
                }
                Section("Select the number of questions") {
                    Stepper("\(numOfQuestions.formatted())", value: $numOfQuestions, in: 5...15, step: 5)
                }
                
                Button("Start Game") {
                    isNotActive.toggle()
                    generateQuestions()
                }
            }
            .transition(.move(edge: .top))
            .animation(.easeInOut)
            
        } else {
            VStack {
                
                Spacer()
                Spacer()
                Spacer()
                VStack(spacing: 25) {
                    
                    Text("Question \(questionNumber)/\(numOfQuestions)")
                        .font(.title2)
                        .foregroundStyle(.white).bold()
                    Text(" What is \(questions[0].question)")
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 30)
                Spacer()
                Spacer()
                
                
                
                VStack(spacing: 60) {
                    ForEach(0..<3) { num in
                        Button {
                            checkAnswer(answer: answers[num])
                        } label: {
                            Text("\(answers[num])")
                                .frame(width: 180, height: 70)
                                .foregroundStyle(.white)
                                .background(.secondary)
                                .clipShape(.capsule)
                                .shadow(radius: 100)
                        }
                    }
                    
                    Spacer()
                }
                HStack {
                    Text("Score: \(score)/\(numOfQuestions)")
                        .font(.title2)
                        .foregroundStyle(.white).bold()
                    Spacer()
                    Button("New Game") {
                        alertTitle = "New Game"
                        alertMessage = "Abort current game?"
                        newGameAlert.toggle() }
                        .font(.title2)
                        .foregroundStyle(.white).bold()
                    
                    
                } 
                .frame(width: 350, height: 30)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.primary)
            .transition(.move(edge: .bottom))
                .animation(.easeInOut)
            .alert(alertTitle,isPresented: $resultAlert) {
                Button("Ok", action: nextQuestion)
            } message: {
                Text(alertMessage)
            }
            .alert(alertTitle,isPresented: $gameOverAlert) {
                Button("Back to main menu", action: endGame)
            } message: {
                Text(alertMessage)
            }
            .alert(isPresented: $newGameAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage),primaryButton: .default(Text("confirm")) {
                    endGame()
                }, secondaryButton: .cancel())
            }
        }
    }
    
    
    private func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "Good Job!"
        } else {
            alertTitle = "Oops!"
            alertMessage = "That was incorrect. Correct answer is \(correctAnswer)"
        }
        
        resultAlert.toggle() 
    }
    
    private func endGame() {
        isNotActive.toggle()
        questionNumber = 1
        score = 0
    }
    
    private func newGame() {
        isNotActive.toggle()
        questionNumber = 1
        score = 0
    }
    
    private func nextQuestion() {
        
        if questions.count > 1 {
            questionNumber += 1
            questions.removeFirst()
            correctAnswer = questions[0].answer
            generateAnswers()
        } else {
            alertTitle = "Game over!"
            alertMessage = "You scored \(score)/\(numOfQuestions)!"
            gameOverAlert.toggle()
        }
        
    }
    
    private func generateQuestions() {
        if !questions.isEmpty {
            questions.removeAll()
        }
        
        for num in 1...numOfQuestions {
            let question = Question(question: "\(numberMultiplication) X \(num)", answer: numberMultiplication * num)
            questions.append(question)
        }
        questions.shuffle()
        correctAnswer = questions[0].answer
        generateAnswers()
    }
    
    private func generateAnswers() {
        if !answers.isEmpty {
            answers.removeAll()
        }
        let incorrect1 = correctAnswer + 1
        let incorrect2 = correctAnswer - 1
        answers = [incorrect1, incorrect2, correctAnswer]
    }
}

#Preview {
    ContentView()
}
