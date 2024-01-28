//
//  ContentView-ViewModel.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 25/1/24.
//

import CoreLocation
import MapKit
import Foundation
import LocalAuthentication
import _MapKit_SwiftUI

extension BucketListView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isHybrid: Bool = false
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var isUnlocked = false
        var alertShown = false
        var alertTitle = "Error"
        var alertMessage = ""
        
        var mapStyle: MapStyle {
            guard isHybrid else {
                return .hybrid
            }
            return .standard
        }
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to:savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func authenticate() async {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                do {
                    let success = try await  context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) 
                    if success {
                        self.isUnlocked = true
                    }
                } catch( let error) {
                    alertMessage = error.localizedDescription
                    alertShown.toggle()
                }
              
            } else {
                if let error = error {
                    alertMessage = error.localizedDescription
                    alertShown.toggle()
                }
            }
        }
    }
}
    
    
