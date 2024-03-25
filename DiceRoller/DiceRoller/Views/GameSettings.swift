//
//  GameSettings.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import SwiftUI

struct GameSettings: View {
    @State private var sides = [4, 6]
    @State private var diceQuantity = [1, 2]
    
    @Bindable var viewModel: GameViewModel
    
    var body: some View {
            Form {                
                Section("Dice Quantity") {
                    Picker("Number of dice", selection: $viewModel.numOfDice) {
                        ForEach(diceQuantity, id: \.self) { side in 
                            Text("\(side)")
                        }
                    }
                }
                
                Section("Number of sides") {
                    Picker("Number of sides", selection: $viewModel.sides) {
                        ForEach(sides, id: \.self) { side in 
                            Text("\(side)")
                        }
                    }
                }
            }
            .preferredColorScheme(.light)
    }
}

#Preview {
    GameSettings(viewModel: GameViewModel())
}
