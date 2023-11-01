//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jeevan Mahtani on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var alertShown = true
    @State private var images = ["scissors", "newspaper", "circle"]
    @State private var choices = ["scissors", "paper", "rock"]
    @State private var outcome = false
    @State private var appChosenItem = ""
    @State private var isWinning = false
    @State private var alertTitle = "New Game"
    @State private var alertMessage = ""
    @State private var alertButtonText = "Start!"
    @State private var score = 0
    @State private var turn = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.red]), startPoint: .top, endPoint: .bottom)
                          .ignoresSafeArea()
            VStack {
                
                Spacer()
                Spacer()
                VStack {
                    Text("Rock Paper Scissors Game")
                        .font(.title)
                        .foregroundStyle(.white).bold()
                        .padding(.bottom,0)
                }
                
                Spacer()
       
                Text("Tap your choice")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.bottom,30)
                VStack(spacing: 60) {
                    
                    ForEach(0..<3) { item in
                        Button {
                            itemTapped(item)
                        } label : {
                            Image(systemName: images[item])
                                .font(.title3)
                                .padding()
                                .foregroundStyle(.white)
                                .frame(width: 200, height: 50)
                                .background(.clear)
                                .border(.ultraThickMaterial,width: 3)
                                .cornerRadius(5)
                        }
                    }
                }
                .frame(width: 300, height: 400)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Text("Score: \(score)/10")
                    .font(.title3)
                    .bold()
                    .padding(.vertical,35)
                    .foregroundStyle(.white)
                Spacer()
                Spacer()
                
            }            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            alertMessage = "Let's play a round. \(playnewTurn())"
        }
        .alert(isPresented: $alertShown) {
            Alert(title: Text(alertTitle),
                  message: Text(alertMessage),
                  dismissButton: .default(Text(alertButtonText)) {
                 
            })
        }.animation(.easeInOut)
    }
    
    func playnewTurn() -> String {
        
        turn += 1
        appChosenItem = choices[Int.random(in: 0...2)]
        isWinning = Bool.random()
        let outcome = isWinning ? "WIN" :"LOSE"
        return "\n\nApp chose \(appChosenItem) and you \(outcome)"
    }
    
    func resetGame() {
        alertTitle = "Game Over!"
        alertMessage = "You won \(score) out of 10 rounds! Play new round? \(playnewTurn())"
        alertButtonText = "Start!"
        turn = 1
        score = 0
        alertShown = true
    }
        
    func itemTapped (_ selection: Int) {
        
        let userChoice = choices[selection]
        let correctAnswer = correctOutcome() 
        if turn == 10 {
            score = userChoice == correctAnswer ? score + 1: 0
            resetGame()
            return
        }
        alertButtonText  = "OK"
        if (userChoice == correctAnswer) {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "You guessed \(userChoice) correctly! \(playnewTurn())"
        } else {
            alertTitle = "Incorrect!"
            alertMessage = "The correct outcome for this is \(correctAnswer). \(playnewTurn())"
        }
       alertShown = true 
        
    }
    
    func correctOutcome() -> String {
        
        if (appChosenItem == "rock" && isWinning) {
            return "paper"
        } else if (appChosenItem == "rock" && !isWinning) {
            return "scissors" 
        } else if (appChosenItem == "paper" && isWinning) {
            return "scissors" 
        } else if (appChosenItem == "paper" && !isWinning) {
            return "rock" 
        } else if (appChosenItem == "scissors" && isWinning) {
            return "rock" 
        } else if (appChosenItem == "scissors" && !isWinning) {
            return "paper" 
        }
        return ""    
    }
    
}



#Preview {
    ContentView()
}
