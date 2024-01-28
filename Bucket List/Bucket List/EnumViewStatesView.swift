//
//  EnumViewStatesView.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 19/1/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct EnumViewStatesView: View {
    enum LoadingState {
        case loading, success, fail
    }
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .fail:
            FailedView()
        }
    }
}

#Preview {
    EnumViewStatesView()
}
