//
//  MultiplicationHomeView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 23/11/23.
//

import SwiftUI

struct MultiplicationHomeView: View {
    @State private var yellowbackgroundOpacity: Double = 1.0
    @State private var greenbackgroundOpacity: Double = 1.0
    @State private var bluebackgroundOpacity: Double = 1.0
    @State private var redbackgroundOpacity: Double = 1.0
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 40) {
                    
                    VStack(spacing: 30) {
                        Text("Multiplication Table Learning")
                            .foregroundStyle(.black)
                            .font(.title)
                        
                    }
                    .padding()
                    .border(.red, width: 4)
                    .padding(.top, 40)
                    
                    VStack(spacing: 5) {
                        //  MenuButtonRowView(title1: "Learn", title2: "Practice")
                        
                        NavRowView(screen1: .test, screen2: .test)
                        
                        MenuButtonRowView(title1: "Test", title2: "Score")
                    }
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    HStack {
                        Image(systemName: "book")
                            .font(.title2).bold()
                            .frame(width: 100,height: 150)
                            .padding(.horizontal, 20)
                            .foregroundColor(.black)
                            .background(Color.yellow.opacity(yellowbackgroundOpacity))
                            .clipShape(.rect(cornerRadius: 20))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                                    self.yellowbackgroundOpacity = 0.2
                                }
                            }
                        
                        Image(systemName: "multiply.square")
                            .font(.title2).bold()
                            .frame(width: 100,height: 150)
                            .padding(.horizontal, 20)
                            .foregroundColor(.black)
                            .background(Color.green.opacity(greenbackgroundOpacity))
                            .clipShape(.rect(cornerRadius: 20))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                                    self.greenbackgroundOpacity = 0.2
                                }
                            }
                    }
                    .frame(width: 300)
                    
                    HStack {
                        Image(systemName: "pencil.and.list.clipboard")
                            .font(.title2).bold()
                            .frame(width: 100,height: 150)
                            .padding(.horizontal, 20)
                            .foregroundColor(.black)
                            .background(Color.blue.opacity(bluebackgroundOpacity))
                            .clipShape(.rect(cornerRadius: 20))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                                    self.bluebackgroundOpacity = 0.2
                                }
                            }
                        
                        Image(systemName: "list.number")
                            .font(.title2).bold()
                            .frame(width: 100,height: 150)
                            .padding(.horizontal, 20)                        
                            .foregroundColor(.black)
                            .background(Color.red.opacity(redbackgroundOpacity))
                            .clipShape(.rect(cornerRadius: 20))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2.5).repeatForever()) {
                                    self.redbackgroundOpacity = 0.2
                                }
                            }
                    }
                    .frame(width: 300)           
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.white)
        }
    }
}
#Preview {
    MultiplicationHomeView()
}
