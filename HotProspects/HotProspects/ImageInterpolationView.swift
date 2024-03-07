//
//  imageInterpolation.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 29/2/24.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolationView()
}
