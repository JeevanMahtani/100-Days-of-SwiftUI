//
//  ScrollView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 27/11/23.
//

import SwiftUI


struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new custom text \(text)")
        self.text = text
    }
}
struct ScrollViewExampleView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollViewExampleView()
}
