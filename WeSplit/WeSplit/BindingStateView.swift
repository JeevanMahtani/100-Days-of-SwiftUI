//
//  BindingStateView.swift
//  WeSplit
//
//  Created by Jeevan Mahtani on 23/10/23.
//

import SwiftUI

struct BindingStateView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is  \(name)")
            ForEach(0..<10) { 
                Text("Row  \($0)")
            }
        }
    }
}

#Preview {
    BindingStateView()
}
