//
//  ContextMenuView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 29/2/24.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }

                
        }
    }
}

#Preview {
    ContextMenuView()
}
