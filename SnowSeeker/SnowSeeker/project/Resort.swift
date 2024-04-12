//
//  Resort.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 5/4/24.
//

import Foundation

struct Resort : Codable, Hashable, Identifiable, Comparable {
    
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
    
    static func < (lhs: Resort, rhs: Resort) -> Bool {
        switch SortingManager.currentCriteria {
        case .default:
            return lhs.id < rhs.id
        case .alphabetical:
            return lhs.name < rhs.name
        case .country:
            return lhs.country < rhs.country
        }
    }
}

enum SortingCriteria {
    case `default`
    case alphabetical
    case country
}

struct SortingManager {
    static var currentCriteria: SortingCriteria = .default
}


