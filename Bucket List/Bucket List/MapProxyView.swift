//
//  MapProxyView.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 20/1/24.
//

import MapKit
import SwiftUI

struct MapProxyView: View {
    var body: some View {
        VStack {
            MapReader { proxy in
                Map()
                    .onTapGesture {
                        position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
            }
        }
    }
}

#Preview {
    MapProxyView()
}
