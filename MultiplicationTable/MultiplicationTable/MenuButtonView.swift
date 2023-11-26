//
//  MenuButtonView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct MenuButtonView: View {
    var title: String = ""
    var body: some View {
        Button(title) {}
            .font(.title2).bold()
            .frame(width: 100,height: 120)
            .padding(.horizontal, 20)
            .border(.black)
            .foregroundColor(.white)
            .background(.black) 
    }
    
}

#Preview {
    MenuButtonView(title: "Item")
}

enum view {
    case test
    
    var view: any View {
        switch(self) {
        case .test: return TestView()
        }
    }
}
