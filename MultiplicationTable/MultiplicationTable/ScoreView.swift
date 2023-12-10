//
//  ScoreView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 4/12/23.
//

import SwiftUI

struct ScoreView: View {
    var scoreObject = Scores()
    var body: some View {
        NavigationStack {  
            if scoreObject.scores.isEmpty {
                EmptyScoreView()
            } else {
                PopulatedScoreView(scoreObject: scoreObject)
            }
        }
    }      
}

#Preview {
    ScoreView()
}

/* for debugging the view
struct ScoreView: View {
    @State private var scores = [Score]()
    var scoreObject = Scores()
    var body: some View {
        NavigationStack {  
            Form {
                List {
                    
                        ForEach(scores) { score in
                            VStack(alignment: .leading, spacing: 10) {
                                Text("\(score.correct) out of \(score.total)")
                                    .font(.title2)
                                    .bold()
                                
                                Text("Date")
                                    .padding(.bottom, 10)
                            }
                            .padding(.top)
                            .listRowBackground(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.clear) // Set orange background
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.blue, lineWidth: 12) // Set red border
                                    )
                            )
                        }
                        .onDelete(perform: removeScore)
                    
                    
                    
                }

            }
            .navigationTitle("Scores")
            .onAppear {
                dummyScores()
            }            
        }
        
    }
    func removeScore(at offsets: IndexSet) {
        scoreObject.scores.remove(atOffsets: offsets)
    }  
    
    func dummyScores() {
        for i in 1..<8 {
            scores.append(Score(correct: i, total: 15))
        }
    }
}

#Preview {
    ScoreView()
 */

