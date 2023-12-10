//
//  Scores.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 8/12/23.
//

import SwiftUI

struct PopulatedScoreView: View {
    var scoreObject: Scores
    var body: some View {
        Form {
            List {
                ForEach(scoreObject.scores) { score in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(score.correct) out of \(score.total)")
                            .font(.title2)
                            .bold()
                        
                        if let date = score.date {
                            Text(date)
                                .padding(.bottom, 10)
                        } else {
                            Text("N/A")
                                .padding(.bottom, 10)
                        }
                    }
                    .padding(.top)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.clear) 
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue, lineWidth: 12))
                    )
                }
                .onDelete(perform: scoreObject.removeScore)
            }
        }
        .navigationTitle("Scores")
    }
}

#Preview {
    let scores = Scores()
    
    scores.scores.append(Score(correct: 5, total: 15))
    scores.scores.append(Score(correct: 2, total: 10))
    scores.scores.append(Score(correct: 5, total: 5))
    scores.scores.append(Score(correct: 4, total: 5))
    scores.scores.append(Score(correct: 10, total: 10))
    
    return PopulatedScoreView(scoreObject: scores)
}
