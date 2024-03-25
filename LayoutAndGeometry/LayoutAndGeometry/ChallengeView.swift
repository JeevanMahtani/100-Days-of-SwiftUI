//
//  ChallengeView.swift
//  LayoutAndGeometry
//
//  Created by Jeevan Mahtani on 20/3/24.
//

import SwiftUI

struct ChallengeView: View {
    let colors: [Color] = [
        Color(hue: 0, saturation: 0.8, brightness: 0.8), // Red
        Color(hue: 0.33, saturation: 0.8, brightness: 0.8), // Green
        Color(hue: 0.67, saturation: 0.8, brightness: 0.8), // Blue
        Color(hue: 0.08, saturation: 0.8, brightness: 0.8), // Orange
        Color(hue: 0.9, saturation: 0.8, brightness: 0.8), // Pink
        Color(hue: 0.8, saturation: 0.8, brightness: 0.8), // Purple
        Color(hue: 0.17, saturation: 0.8, brightness: 0.8) // Yellow
    ]
    let topEdgeThreshold = 200
    let bottomEdgeThreshold = 680

    var body: some View {
        GeometryReader { fullView in       
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        let maxY = fullView.size.height - proxy.frame(in: .global).maxY
                   
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7].hueRotation(Angle(degrees: minY / 2)))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(minY <= 200 ? minY / 2000 : 1)
                          
                            .scaleEffect(size(from: minY))
                            .animation(.easeOut(duration: 1))
                           .onTapGesture {
                               print(minY)
                               print("size\(size(from: minY)))")
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
    }
    
    private func size(from proxy: CGFloat) -> Double {
        if proxy >= 680 {
            return proxy / (proxy  / 2)
        } else if proxy <= 200 {
            let size = proxy / 250
            return max(size,0.5)
        } else {
            return 1
        }
    }
    
    
    
}

#Preview {
    ChallengeView()
}
