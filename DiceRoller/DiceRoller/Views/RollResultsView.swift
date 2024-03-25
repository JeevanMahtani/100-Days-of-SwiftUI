//
//  RollResultsView.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import SwiftData
import SwiftUI


struct RollResultsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var results : [DiceResult]
    var body: some View {
        if results.isEmpty {
            NoResultsView()
        } else {
            VStack {
                List{
                    ForEach(results) { result in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Total rolled: \(result.result)")
                                    .font(.title2)
                                    .bold()
                                
                                Text("Number of dice: \(result.numOfDice)")
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text(result.rollDate)
                                .font(.headline)
                        }
                    }.onDelete(perform: deleteResult)
                }
            }
            .toolbar {
                EditButton()
            }
           
        }
    }
    private func deleteResult(at offsets: IndexSet) {
        for offset in offsets {
            let result = results[offset]
            modelContext.delete(result)
        }
    }
}

struct NoResultsView: View {
    var body: some View {
        Text("No previous rolls")
    }
}

#Preview {
    RollResultsView()
}
