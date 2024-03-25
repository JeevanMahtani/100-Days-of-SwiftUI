//
//  AddRobotView.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 21/3/24.
//

import SwiftUI

struct AddRobotView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack {
                    
                  Spacer()
                    
                    VStack {
                   
                        Spacer()
                        
                        Image(.addvacuum)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                           // .border(.red)
                       
                        Spacer()
                        
                       
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                   // .border(.blue)
                  
                    VStack {    
                        Text("Welcome to Tapo Robot Vacuums")
                        
                            .font(.system(size: 16))
                            .padding(.horizontal)  
                        VStack {
                            Text("Add a robot vacuum and clean whenever, wherever,")
                                .font(.system(size: 14))
                                .padding(.horizontal)
                            
                            Text("and however you want. Free yourself from chores.")
                                .font(.system(size: 14))
                                .padding(.horizontal)
                                .padding(.bottom, 30)
                            
                            Button(action: {
                                
                            }) {
                                Text("Add Robot Vacuum")
                                    .foregroundColor(.blue)
                                    .bold()
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .clipShape(.capsule)
                                    .background(Color(red: 196, green: 224, blue: 245))
                                    .cornerRadius(20)
                                
                                   
                            }
                            .buttonStyle(PlainButtonStyle())
                      
                        }
                        .foregroundStyle(.gray)
                        .padding(.top, 2)
                      //  .border(.red)
                    }
                  //  .border(.green)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }                         
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus.circle") 
                            .foregroundStyle(.black)
                    }
                }
            }
            //border(.black,width: 4)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    AddRobotView()
}
