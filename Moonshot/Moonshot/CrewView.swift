//
//  CrewView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 1/12/23.
//

import SwiftUI

struct CrewView: View {
    var crew = [MissionView.CrewMember]()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(decorative: crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .fontStyle(for: crewMember.role)

                                Text(crewMember.role)
                                    .fontStyle(for: crewMember.role)
                            }
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel("\(crewMember.astronaut.name), role: \(crewMember.role)")
                            .accessibilityHint("Tap to view more information about this astronaut")
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission = MissionView(mission: missions[1], astronauts: astronauts)
    let crew = mission.crew
    return CrewView(crew: crew)
}
