//
//  EditView-ViewModel.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 27/1/24.
//

import Foundation

extension EditView {
    
    @Observable
    class ViewModel {
        
        enum LoadingState {
            case loading, loaded, failed
        }
    
        var name: String
        var description: String 
        var location : Location
        var pages = [Page]()
        var loadingState = LoadingState.loading
        
        init(location: Location) {
            self.name = location.name
            self.description = location.description
            self.location = location
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                self.pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
        
        func save() -> Location {
            var newLocation = location
            newLocation.name = name
            newLocation.description = description
            newLocation.id = UUID()
            return newLocation
        }
    }
}
