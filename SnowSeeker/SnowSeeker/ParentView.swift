//
//  StateObjectView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 2/4/24.
//

import SwiftUI

class SubViewModel: ObservableObject {
    @Published var countText: String = "0"
    private var count: Int = 0
    
    func didClickIncrement() {
        count += 1
        countText = "\(count)"
    }
}

struct SubView: View {
    @ObservedObject var viewModel = SubViewModel()
    
    var body: some View {
        VStack {
            Button("Increment") {
                viewModel.didClickIncrement()
            }
            Text(viewModel.countText)
        }
    }
}

class ParentViewModel: ObservableObject {
    @Published var text: String = ""
}

struct ParentView: View {    
    @ObservedObject var viewModel = ParentViewModel()
    var body: some View {
        VStack {
            TextField("Text", text: $viewModel.text)
            SubView()
        }
    }
}

#Preview {
    ParentView()
}
