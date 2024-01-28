//
//  MapView.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 20/1/24.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 3.1319,longitude: 101.6841),
            span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 0.5)
        )
    )
    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.hybrid(elevation: .realistic))
                .onMapCameraChange(frequency: .continuous) { context in
                    print(context.region)
                }
            
            HStack(spacing: 50) {
                Button("Paris") {
                    position =  MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566,longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                
                Button("Tokyo") {
                    position =  MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 35.6897,longitude: 139.6922),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    MapView()
}
