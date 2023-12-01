//
//  NavView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct NavView: View {
    var screen: Screen
    var action : () -> Void
    var body: some View {
        Button(screen.label, action: action) 
             
                .font(.title2).bold()
                .frame(width: 100,height: 120)
                .padding(.horizontal, 20)
                .border(.black)
                .foregroundColor(.white)
                .background(.black) 
                .contentShape(Rectangle())
    }
}

#Preview {
    NavView(screen: Screen.test, action: {} )
}

enum Screen {
    case test
    
    var label : String {
        switch(self) {
        case .test: return "Test"
        }
    }
    var view: some View {
        switch(self) {
        case .test: return AnyView(TestView())
        }
    }
}
