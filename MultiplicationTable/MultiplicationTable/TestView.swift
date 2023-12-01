//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 21/11/23.
//

import SwiftUI

struct TestView: View {
    
    @State private var numOfQuestions = 5
    @State private var numberMultiplication = 1
    @State private var isNotActive = false
    @State private var questionLibrary = Questions()
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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            if(!isNotActive) {
                VStack {
                    Text("Test Settings")
                        .font(.title2).bold()
                        .foregroundStyle(.white)
                        .padding(.top)
                    Form {
                        
                        
                        Section("Select a number from 1 to 12") {
                            Stepper("\(numberMultiplication.formatted())", value: $numberMultiplication, in: 1...12, step: 1)
                        }
                        Section("Select the number of questions") {
                            Stepper("\(numOfQuestions.formatted())", value: $numOfQuestions, in: 5...15, step: 5)
                        }
                        
                        
                    }
                    .frame(width: .infinity, height: 210)
                    .clipShape(.rect(cornerRadius: 20))
                    .animation(.linear)
                    .transition(.move(edge: .top))
                    .padding(.horizontal)
                    .padding(.bottom)
                    VStack(spacing: 20) {
        
                        
                        Button(action: {
                            isNotActive.toggle()
                            questionLibrary = Questions(numberOfQuestions: numOfQuestions, number: numberMultiplication)
                        }) {
                            Text("Start Test")
                                .font(.headline)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                                .padding(.horizontal, 20)
                        } 
        
                        Button(action: {
                            dismiss()
                            
                        }) {
                            Text("Close")
                                .font(.headline)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 20)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                                .padding(.horizontal, 20)
                        }                           
                    }
                    Spacer()
                }
                
            } else {
                VStack {
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack(spacing: 25) {
                        
                        Text("Question \(questionLibrary.questionNumber)/\(questionLibrary.numberOfQuestions)")
                            .font(.title2)
                            .foregroundStyle(.white).bold()
                        Text(" What is \(questionLibrary.questions[0].question)")
                            .foregroundStyle(.white)
                    }
                    .padding(.bottom, 30)
                    Spacer()
                    Spacer()
                    
                    
                    
                    VStack(spacing: 60) {
                        ForEach(0..<3) { num in
                            Button {
                                questionLibrary.checkAnswer(answer: questionLibrary.answers[num])
                                resultAlert.toggle() 
                            } label: {
                                Text("\(questionLibrary.answers[num])")
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
                        Text("Score: \(questionLibrary.score)/\(questionLibrary.numberOfQuestions)")
                            .font(.title2)
                            .foregroundStyle(.white).bold()
                        Spacer()
                        Button("New Game") {
                            questionLibrary.abortGame()
                            newGameAlert.toggle() }
                        .font(.title2)
                        .foregroundStyle(.white).bold()
                        
                        
                    } 
                    .frame(width: 350, height: 30)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
                .alert(questionLibrary.alertTitle,isPresented: $resultAlert) {
                    Button("Ok") {
                       let gameOver = questionLibrary.nextQuestion()
                        if gameOver {
                            gameOverAlert = true
                        }
                    }
                } message: {
                    Text(questionLibrary.alertMessage)
                }
                .alert(questionLibrary.alertTitle,isPresented: $gameOverAlert) {
                    Button("Back to main menu") {
                        questionLibrary.endGame()
                        isNotActive.toggle()
                    }
                } message: {
                    Text(questionLibrary.alertMessage)
                }
                .alert(isPresented: $newGameAlert) {
                    Alert(title: Text(questionLibrary.alertTitle), message: Text(questionLibrary.alertMessage),primaryButton: .default(Text("confirm")) {
                        questionLibrary.endGame()
                        isNotActive.toggle()
                    }, secondaryButton: .cancel())
                }
            }
        }
    }
}

#Preview {
    TestView()
}
