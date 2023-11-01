//
//  ModifierOrderView.swift
//  ViewsAndModifiers
//
//  Created by Jeevan Mahtani on 30/10/23.
//

import SwiftUI

struct ModifierOrderView: View {
    var body: some View {
        Button("Nothing") {
            
        }
        .frame(width: 200, height: 200)
        
        Text("Hello, world")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
            .padding()
            .background(.red)
        
        
    }
}

#Preview {
    ModifierOrderView()
}
