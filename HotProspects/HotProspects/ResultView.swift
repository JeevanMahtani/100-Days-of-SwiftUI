//
//  ResultView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 29/2/24.
//

import SwiftUI

struct ResultView: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)           
            let readings = try JSONDecoder().decode([Double].self, from: data)   
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Ero: \(error.localizedDescription)"
        }
      /*  do {
            output = try result.get()
        } catch {
            output = "Error: \(error.localizedDescription)"
        }*/
    }
}

#Preview {
    ResultView()
}
