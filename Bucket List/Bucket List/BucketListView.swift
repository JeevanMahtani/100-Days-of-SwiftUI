//
//  BucketListView.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 21/1/24.
//

import MapKit
import SwiftUI

struct BucketListView: View {
    @State private var startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56,longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            NavigationStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate ) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }            
                        } 
                    }
                    .mapStyle(viewModel.mapStyle)
                    .onTapGesture {  position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                }
                .toolbar {
                    Button("Switch view") {
                        viewModel.isHybrid.toggle()
                    }
                }
            }
        } else {
            Button("Unlock Places") {
                Task {
                    await viewModel.authenticate()
                }
            }
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .alert(isPresented: $viewModel.alertShown) {
                Alert(
                    title: Text(viewModel.alertTitle),
                    message: Text(viewModel.alertMessage)
                )
            }
        }
    }   
}

#Preview {
    BucketListView()
}
