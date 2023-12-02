//
//  MoonshotView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 28/11/23.
//

import SwiftUI

struct MoonshotView: View {
    @State private var isListView = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack {
            Group {
                if isListView {
                    MoonshotListView(astronauts: astronauts, missions: missions)
                        .transition(.slide)
                } else {
                    MoonshotGridView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(action: {
                    withAnimation {
                        isListView.toggle()
                    }
                    
                }) {
                    Text("Switch view")
                        .font(.title2).bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.trailing, 5)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
            }
        }
        .transition(.slide)
    }
}

#Preview {
    MoonshotView()
}
