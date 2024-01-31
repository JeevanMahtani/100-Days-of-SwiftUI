//
//  FlagGameTwoView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 28/10/23.
//

import SwiftUI

struct FlagGameTwoView: View {
    @State private var showingScore = false
    @State private var flagMovement = 0.0
    @State private var score = 0
    @State private var questionCount = 0
    @State private var isLastQuestion = false
    @State private var correctFlagOffset = 0.0
    @State private var scoreTitle = ""
    @State private var flagNumber = 0
    @State private var opacity = 1.0
    @State private var countries = ["Estonia", "France" , "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    @State private var countriesList = [String: Bool]()
    
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
                            flagNumber = number
                            flagMovement += 360
                        }
                        
                    label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                            .opacity(
                                countriesList[countries[number]] ?? true ? 1: 0.25)
                            .scaleEffect(
                                countriesList[countries[number]] ?? true ? 1: 0.5)
                            .animation(.bouncy)
                            .rotation3DEffect(
                                .degrees(flagMovement)
                                ,axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .accessibilityLabel(labels[countries[number], default: ""])    
                        
                        
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,50)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score) / 8")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
            }
            .padding()
            .onAppear {
                setShuffledCountries()
            }
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
        
        setOpacityBasedonSelectedCountry(number)
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
        countriesList.removeAll()
        setShuffledCountries()
        correctAnswer = Int.random(in: 0...2)
        correctFlagOffset = 0.0
    }
    
    
    func resetGame() {
        questionCount = 0
        isLastQuestion = false
        score = 0
        askQuestion()
    }
    
    func setOpacityBasedonSelectedCountry(_ number: Int) {
        for (country, value) in countriesList {
            if country != countries[number] {
                countriesList[country] = false
            }
        }
    }
    
    func setShuffledCountries() {
        countriesList[countries[0]] = true
        countriesList[countries[1]] = true
        countriesList[countries[2]] = true
    }
    
    func offsetAmount(_ number: Int) -> Double {
        let val = countriesList[countries[number]] ?? true ? 0.0: -100.0
        return val
    }
}

#Preview {
    FlagGameTwoView()
}
