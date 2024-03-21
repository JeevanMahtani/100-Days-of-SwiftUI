//
//  GeometryReaderEffectsView.swift
//  LayoutAndGeometry
//
//  Created by Jeevan Mahtani on 19/3/24.
//

import SwiftUI

struct GeometryReaderEffectsView: View {
    let colours: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colours[index % 7])
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    GeometryReaderEffectsView()
}
