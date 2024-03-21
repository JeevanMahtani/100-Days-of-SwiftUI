//
//  CustomisedAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by Jeevan Mahtani on 17/3/24.
//

import SwiftUI

struct CustomisedAlignmentView: View {
    var body: some View {
        VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in
//                    d[.trailing]   
//                }
//            Text("This is a longer line of text")
            
            ForEach(0..<10) { position in
             Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                     Double(position) * -10   
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    CustomisedAlignmentView()
}
