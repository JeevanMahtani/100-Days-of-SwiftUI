//
//  ObservableObjectsView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 31/3/24.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        
        @Bindable var player = player
        Stepper("Your high score: \(player.highScore)", value: $player.highScore)
    }
}


struct ObservableObjectsView: View {
    @State private var player = Player()
    var body: some View {
        VStack {
            Text("Welcome")
            HighScoreView()
        }
        .environment(player)
    }
}


#Preview {
    ObservableObjectsView()
}
