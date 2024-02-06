//
//  Location.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 5/2/24.
//

import MapKit
import Foundation

struct Location: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
