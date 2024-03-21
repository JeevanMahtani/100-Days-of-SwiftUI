//
//  CustomAlignmentGuideView.swift
//  LayoutAndGeometry
//
//  Created by Jeevan Mahtani on 17/3/24.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuideView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@swiftasroy")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]    
                    }
                Image(.roybot)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                
                Text("Jeevan Mahtani")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]    
                    }
                
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    CustomAlignmentGuideView()
}
