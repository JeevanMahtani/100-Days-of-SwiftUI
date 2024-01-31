//
//  ContentView.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 2/1/24.
//

import SwiftUI

struct QuikAppOTAInstallingView: View {
    
    @State private var rotation = 0.0
    @State private var toggleState = false
    
    let customBlue = Color(red: 23, green: 176, blue: 253)
    let customGray = Color(red: 164, green: 165, blue: 165)
    
    var body: some View {
        VStack {
            Text("Update Camera")
                .bold()
            
            Spacer()
            
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(customGray, lineWidth: 8)
                    .frame(width: 80)
                    .rotationEffect(.degrees(rotation))
                    .onAppear {                    
                        self.rotation = 360.0
                    }
                    .animation(.linear(duration: 1.0).repeatForever(autoreverses: false))
                
                Circle()
                    .trim(from: 0.0, to: 0.7)
                    .stroke(customBlue, lineWidth: 8)
                    .frame(width: 50)
                    .rotationEffect(.degrees(-rotation))
                    .onAppear {
                        self.rotation = 360.0
                        
                    }
                    .animation(.linear(duration: 1.0).repeatForever(autoreverses: false))
            }
            
            Spacer()
            
            VStack {
                Text("Installing Update")
                    .font(.system(size: 24))
                    .padding(.bottom, 20)
                    .bold()
                
                Text("Dont Go Anywhere")
                    .font(.system(size: 16))
                
                Text("Do not exit the GoPro Quik app or turn off")
                    .font(.system(size: 16))
                
                Text("your camera during this process.")
                    .font(.system(size: 16))
            }
            
            CustomSwitch(isOn: $toggleState)
            CustomSegmentedPicker()
                        
            Spacer()
            
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Image(systemName:  "square.fill")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .offset(x: -10)
                        .padding(.bottom, 18)
                        .foregroundColor(customBlue)
                    
                    Text("Don't leave the app. Your GoPro will power off and on a few times.")
                        .opacity(0.7)
                }
                
                HStack {
                    Image(systemName:  "square.fill")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .offset(x: -10)
                        .padding(.bottom, 18)
                        .foregroundColor(customBlue)
                    
                    Text("When the update is complete, your camera screen will return to normal.")
                        .opacity(0.7)
                }
                
                Spacer() 
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 250)
        }
        .padding()
        .preferredColorScheme(.light)
    }
}

#Preview {
    QuikAppOTAInstallingView()
}
