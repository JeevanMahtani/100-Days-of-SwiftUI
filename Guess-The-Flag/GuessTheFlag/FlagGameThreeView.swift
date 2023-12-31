//
//  FlagGameThreeView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 28/10/23.
//

import SwiftUI

struct FlagGameThreeView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France" , "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(stops:
                            [.init(color: Color(red: 0.13, green: 0.98, blue: 0.32), location: 0.01),
                             .init(color: Color(red: 0.76, green: 0.26, blue: 0.6), location: 0.99)
                            ], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack{   
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.bold))
                            .foregroundStyle(.white)
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .clipShape(.rect(cornerRadius: 20))
                                .shadow(radius: 5)
                                .animation(.linear)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,50)
        
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
               
            }
            .padding()
        }
        .alert(scoreTitle,isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    FlagGameThreeView()
}
