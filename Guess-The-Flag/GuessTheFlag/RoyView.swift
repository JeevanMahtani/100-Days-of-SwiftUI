//
//  RoyView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 10/11/23.
//

import SwiftUI

struct RoyView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        ZStack { 
            Color.black.opacity(1).ignoresSafeArea()
            VStack{
                VStack{
                    VStack  {
                        Text("Hacking with Swift")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                        
                        Image("roybot")
                            .resizable()
                            .scaledToFit()
                            .opacity(1)
                            .frame(width: 400, height: 240)
                            .clipShape(.circle, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                            .rotation3DEffect(
                                .degrees(animationAmount)
                                ,axis: (x: 0, y: 1, z: 0)
                            )
                            .onAppear { 
                                /*withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                                    animationAmount += 360*/
                                
                            }
                        
                        
                    }
                    .frame(width: 300, height: 400)
                    .background(Color.blue.opacity(0.9).blur(radius: 10))
                    .padding(.leading,20)
                    .padding(.trailing, 20)
                    
                }
                .frame(width: 350, height: 500)
                .background(Color.red.opacity(1).blur(radius: 10))
                
                
            }
            .frame(width: 390, height: 570)
            .background(Color.orange.opacity(1).blur(radius: 10))
            
            .frame(maxHeight: .infinity)
            
           
        }
    }
        
}

#Preview {
    RoyView()
}
