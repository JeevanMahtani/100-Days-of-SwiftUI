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
                Form {
                    List {
                        ForEach(scoreObject.scores) { score in
                            Text("\(score.correct) out of \(score.total)")
                        }
                        .onDelete(perform: removeScore)
                    }
                }
                .navigationTitle("Scores")
            }
        }
    }
    func removeScore(at offsets: IndexSet) {
        scoreObject.scores.remove(atOffsets: offsets)

    }
}

#Preview {
    ScoreView()
}
