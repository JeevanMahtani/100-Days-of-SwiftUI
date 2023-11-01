//
//  ButtonView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 27/10/23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack{
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            Button("Button 5") { }
                .buttonStyle(.borderedProminent)
                .tint(.indigo)
        }
        Button("Delete Selection",role: .destructive,action: delete)    
        }
    func delete() {
        print("deleting")
    }
}

#Preview {
    ButtonView()
}
