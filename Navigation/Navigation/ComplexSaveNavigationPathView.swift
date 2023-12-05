//
//  SaveNavigationPathView.swift
//  Navigation
//
//  Created by Jeevan Mahtani on 5/12/23.
//

import SwiftUI


struct CodableComplexDetailView: View {
    var number: Int
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            }
    
}

@Observable
class ComplexPathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "ComplexSavedPath")
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
    
}
struct ComplexSaveNavigationPathView: View {
    @State private var pathStore = ComplexPathStore()
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            CodableComplexDetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    CodableComplexDetailView(number: i)
                }
        }
    }
}

#Preview {
    SaveNavigationPathView()
}
