//
//  ContentView.swift
//  UiIdeas
//
//  Created by Jeevan Mahtani on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlertSignUp = false
    @State private var showAlertLogIn = false
    var body: some View {
        VStack {
            
            VStack(spacing:10) {
                Spacer()
                Group {
                    Image(systemName: "house")
                        .frame(maxHeight: .infinity)
                        .font(.system(size: 100))
                        .foregroundColor(Color.blue)
                    
                    Image(systemName: "creditcard")
                        .frame(maxHeight: .infinity)
                        .font(.system(size: 100))
                        .foregroundColor(Color.green)
                    
                    Image(systemName: "cross.case")
                        .frame(maxHeight: .infinity)
                        .font(.system(size: 100))
                        .foregroundColor(Color.red)
                }
                .frame(width: 300)
                .background(.thinMaterial)
                .cornerRadius(20)
                
                VStack {
                    
                    Text("App Logo")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Text("Second App Logo")
                        .font(.custom("FontNameRound", size: 35))
                    Text("Title 3")
                        .font(.largeTitle)
                    
                    Button {
                        showAlertSignUp = true
                    } label : {
                        Text("Get started")
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(width: 320, height: 60)
                            .background(.black)
                            .border(.black,width: 3)
                            .cornerRadius(30)
                    }
                    .alert(isPresented: $showAlertSignUp) { 
                        Alert(title: Text("Hello"),
                              message: Text("Sign up?"),
                              dismissButton: .default(Text("OK")) {
                            
                        })
                    }
                    
                    Button {
                        showAlertLogIn = true
                    } label : {
                        Text("Log In")
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(width: 320, height: 60)
                            .background(.primary)
                            .cornerRadius(30)
                    }
                    .alert(isPresented: $showAlertLogIn) { 
                        Alert(title: Text("Hello"),
                              message: Text("Log in?"),
                              dismissButton: .default(Text("OK")) {
                            
                        })
                    }
                } 
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
                
            }
        }     
    }
}
#Preview {
    ContentView()
}
