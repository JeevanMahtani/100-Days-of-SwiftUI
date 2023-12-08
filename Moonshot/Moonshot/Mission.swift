//
//  Mission.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 28/11/23.
//

import Foundation

struct Mission: Hashable, Codable, Identifiable, Equatable {
    
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        // Compare the relevant properties to determine equality
        return lhs.id == rhs.id
            && lhs.launchDate == rhs.launchDate
            && lhs.crew == rhs.crew
            && lhs.description == rhs.description
    }
    
    struct CrewRole: Codable, Equatable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }

}
