//
//  GeometryReaderView.swift
//  LayoutAndGeometry
//
//  Created by Jeevan Mahtani on 19/3/24.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        HStack {
            Text("Important")
                .frame(width: 200)
                .background(.blue)
            GeometryReader { proxy in
                Image(.roybot)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
           
               
        
    }
}

#Preview {
    GeometryReaderView()
}
