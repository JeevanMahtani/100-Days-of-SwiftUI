//
//  CustomModifierView.swift
//  ViewsAndModifiers
//
//  Created by Jeevan Mahtani on 30/10/23.
//

import SwiftUI

struct LargeBlue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
    
    func largeBlue() -> some View {
        modifier(LargeBlue())
    }
}

struct Watermark: ViewModifier {
    var text =  ""
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
    
        }

    }
}
struct CustomModifierView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
        
        Color.blue
            .frame(width: 300, height: 300)
            .watermarked(with: "some string")
        
        Text("test")
            .largeBlue()
    }
    
    
}

#Preview {
    CustomModifierView()
}
