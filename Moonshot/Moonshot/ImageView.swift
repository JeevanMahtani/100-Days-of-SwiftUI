//
//  ContentView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 27/11/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
        // .frame(width: 300, height: 300)
            .containerRelativeFrame(.horizontal) { size, axis in  
                size * 0.8
            }
    }
}

#Preview {
    ImageView()
}
