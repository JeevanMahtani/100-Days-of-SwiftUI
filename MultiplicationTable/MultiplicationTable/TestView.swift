//
//  TestView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 6/12/23.
//

import SwiftUI

struct TestView: View {
 
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var resultAlert =  false
    @State private var gameOverAlert =  false
    @State private var newGameAlert = false
    
    @Binding var scores: Scores
    @Binding var questionLibrary: Questions
    @Binding var testDisplayed: Bool
    
    var body: some View {
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
                testDisplayed = false
                questionLibrary.endGame(scoreResult: scores)
            }
        } message: {
            Text(questionLibrary.alertMessage)
        }
        .alert(isPresented: $newGameAlert) {
            Alert(title: Text(questionLibrary.alertTitle), message: Text(questionLibrary.alertMessage),primaryButton: .default(Text("confirm")) {
                testDisplayed = false
                questionLibrary.endGame(scoreResult: scores)
            }, secondaryButton: .cancel())
        }

    }
}

#Preview {
    let questions = Questions(numberOfQuestions: 10, number: 2)
    questions.numberOfQuestions = 10
    questions.score = 5
    let scores = Scores()
    return TestView(scores: .constant(scores), questionLibrary: .constant(questions), testDisplayed: .constant(false))
}
