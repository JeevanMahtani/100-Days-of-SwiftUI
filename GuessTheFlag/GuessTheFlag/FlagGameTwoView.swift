//
//  FlagGameTwoView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 28/10/23.
//

import SwiftUI

struct FlagGameTwoView: View {
    @State private var showingScore = false
    @State private var score = 0
    @State private var questionCount = 0
    @State private var isLastQuestion = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France" , "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15,blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            VStack{   
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.bold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,50)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
               
            }
            .padding()
        }
        .alert(scoreTitle,isPresented: $isLastQuestion) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Total Score: \(score) out of 8 correct!")
        }
        .alert(scoreTitle,isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        questionCount += 1
        
        if number == correctAnswer {
            score = score + 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Oops! \(countries[number]) is incorrect. The correct answer is \(countries[correctAnswer])"
        }
        
        if questionCount == 8 {
            scoreTitle = "Game over!"
            isLastQuestion = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
    func resetGame() {
        questionCount = 0
        isLastQuestion = false
        score = 0
        askQuestion()
    }
}

#Preview {
    FlagGameTwoView()
}
