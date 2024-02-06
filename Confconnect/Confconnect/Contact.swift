//
//  Contact.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 6/2/24.
//

import MapKit
import Foundation
import PhotosUI
import SwiftUI


struct Contact: Identifiable, Codable, Comparable {
    
    var id: UUID
    var name: String
    var imagePath: String?
    var coordinates: [CLLocationDegrees]?
    
    
    var pinPosition: CLLocationCoordinate2D? {
        guard let coordinates = coordinates else { return  nil }
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
    
    var mapPositionBinding: Binding<MapCameraPosition>? {
        guard let coordinates = coordinates else { return nil }
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1]),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
        
        return Binding(get: {
            MapCameraPosition.region(region)
        }, set: { _ in })
    }

    var image: Image? {
        guard let imagePath = imagePath, 
              let fileURL = URL(string: imagePath), 
              let uiImage = UIImage(contentsOfFile: fileURL.path) else {
            return Image(systemName: "person.crop.circle.fill")
        }
        return Image(uiImage: uiImage)
    }
    
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
    
#if DEBUG
    static let example = Contact(id: UUID(), name: "Test Contact", coordinates: [51.501, -0.141])
    static let example2 = Contact(id: UUID(), name: "Test Contact 2")
#endif
}
