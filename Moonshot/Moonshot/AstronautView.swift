//
//  AstronautView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 30/11/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        VStack {
            ScrollView {
                Image(decorative: astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
