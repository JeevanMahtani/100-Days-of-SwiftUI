//
//  MoonshotListView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 1/12/23.
//

import SwiftUI

struct MoonshotListView: View {
    
    let astronauts: [String: Astronaut] 
    
    let missions: [Mission] 
    
    var body: some View {
            VStack {
                ZStack {
                    Color.darkBackground.ignoresSafeArea()
                    List {
                        ForEach(missions) { mission in
                            NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                                VStack(spacing: 2){
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(mission.displayName)
                                                .font(.title).bold()
                                            Text(mission.formattedDate)
                                                .font(.headline)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height : 80)
                                        
                                    }
                                    .padding(.horizontal)
                                }
                                
                            }
                            .listRowSeparator(.visible).frame(width: .infinity, height: 130).background(.lightBackground)

                            .clipShape(.rect(cornerRadius: 15))
                            .listRowBackground(Color.darkBackground).frame(width: .infinity)
                            .foregroundStyle(.white)
                            
                            
                            
                        }
                    }
                    .listStyle(PlainListStyle()) 
                }
                
            }
            .transition(.move(edge: .bottom))
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
   return MoonshotListView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
