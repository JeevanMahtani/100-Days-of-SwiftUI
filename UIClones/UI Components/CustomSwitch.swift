//
//  SwiftUIView.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 30/1/24.
//

import SwiftUI

struct CustomSwitch: View {
    
    @State private var switchPosition = -30.0
    @State private var imagePosition = -30.0
    @State private var switchBackground = Color.black
    @State private var switchColor = Color.gray
    @State private var imageColor = Color.black
    @State private var rotation = 0.0
    @State private var duration = 0.3
    @Binding var isOn: Bool
    
    var body: some View {
        
        ZStack {
            Capsule()
                .frame(width:100,height:44)
                .foregroundColor(isOn ? Color.green : Color.black)
                .animation(.easeIn(duration: duration))
            
            ZStack {
                Circle()
                    .frame(width:40, height:35)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x: isOn ? 30: -30)
                    .animation(.spring(duration: duration))
                
                Image(systemName: "arrowshape.left")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                    .foregroundStyle(isOn ? Color.green: Color.black)
                    .rotationEffect(.degrees(isOn ? 180: 0), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: isOn ? 30: -30) 
                    .animation(.smooth(duration: duration))
            }            
        }
        .onTapGesture {
            isOn.toggle()             
        }        
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var isOnPreview = false
        
        var body: some View {
            CustomSwitch(isOn: $isOnPreview)
        }
    }
    return PreviewWrapper()    
}
