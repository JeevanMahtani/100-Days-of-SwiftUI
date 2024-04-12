//
//  HomeView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 5/4/24.
//

import SwiftUI

struct HomeView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    @State private var favourites = Favourites()
    @State private var currentCriteria: SortingCriteria = .default
    
    var filteredResorts: [Resort] {
        guard !searchText.isEmpty else { return sorted(resorts) }     
        return sorted(resorts.filter {$0.name.localizedStandardContains(searchText)})
    }
        
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            
                            Text("\(resort.runs)")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favourites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favourite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Button("Default") {
                        currentCriteria = .default
                    }
                    Button("Alphabetical") {
                        currentCriteria = .alphabetical
                    }
                    Button("Country") {
                        currentCriteria = .country
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favourites)

    }
    
    private func sorted(_ resorts: [Resort]) -> [Resort] {
        switch currentCriteria {
        case .default:
            return resorts.sorted()
        case .alphabetical:
            return resorts.sorted(by: <)
        case .country:
            return resorts.sorted { $0.country < $1.country }
        }
    }
}

#Preview {
    HomeView()
}
