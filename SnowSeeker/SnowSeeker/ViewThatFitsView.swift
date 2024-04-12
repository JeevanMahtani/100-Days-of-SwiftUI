//
//  ViewThatFitsView.swift
//  SnowSeeker
//
//  Created by Jeevan Mahtani on 27/3/24.
//

import SwiftUI

struct ViewThatFitsView: View {
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ViewThatFitsView()
}
