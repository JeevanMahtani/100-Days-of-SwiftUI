//
//  MissionView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 29/11/23.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(decorative: mission.image) 
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {
                        width, axis in width * 0.6
                    }
                
                VStack(alignment: .leading) {
                    Text("Launch date: \(mission.formattedDate)")
                       .font(.title2).bold()
                   
                }
                .padding(.top)
                .accessibilityElement()
                .accessibilityValue("Launch Date: \(mission.formattedDate == "N/A" ? "Not Applicable" : "\(mission.formattedDate)")")
                
                VStack(alignment: .leading) {
                    
                    DividerView()
                    
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                        
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    DividerView()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewView(crew: crew)

            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    

}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
