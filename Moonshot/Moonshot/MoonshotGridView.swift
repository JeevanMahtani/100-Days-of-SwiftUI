//
//  MoonshotGridView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 2/12/23.
//

import SwiftUI

struct MoonshotGridView: View {
    let astronauts: [String: Astronaut]    
    let missions: [Mission] 
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(decorative: mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height : 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            .accessibilityElement()
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel("Mission: \(mission.displayName), ")
                            .accessibilityValue("Launch Date: \(mission.formattedDate == "N/A" ? "Not Applicable" : "\(mission.formattedDate)")")
                            .accessibilityHint("Tap to view more details about the mission")
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius:  10)
                            .stroke(.lightBackground)
                        )
                    }
                    .navigationDestination(for: Mission.self) { mission in
                        MissionView(mission: mission, astronauts: astronauts)
                    }
                } 
                
            }
       
            .padding([.horizontal, .bottom])
            .background(.darkBackground)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
   return MoonshotGridView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
