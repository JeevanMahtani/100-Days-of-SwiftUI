//
//  MapView.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 20/1/24.
//

import MapKit
import SwiftUI



struct Place: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapAnnotationsView: View {
    
    let locations = [
        Place(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude:  -0.141)),
        Place(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude:  -0.076))
    ]
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 3.1319,longitude: 101.6841),
            span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 0.5)
        )
    )
    var body: some View {
        VStack {
            Map {
                ForEach(locations) { location in
                    /*Marker(location.name, coordinate: location.coordinate)   */
                    Annotation(location.name,  coordinate: location.coordinate) {
                        Text(location.name)
                            .font(.headline)
                            .padding()
                            .background(.blue.gradient)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                    .annotationTitles(.hidden)
                }
            }
        }
    }
}

#Preview {
    MapAnnotationsView()
}
