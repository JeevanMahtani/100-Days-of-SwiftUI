//
//  PracticeUIView.swift
//  GuessTheFlag
//
//  Created by Jeevan Mahtani on 29/10/23.
//

import SwiftUI

struct PracticeUIView: View {
    @State private var words = ["Cats", "Toothpaste", "Spider", "Crown"]
    @State private var colors : [Material] = [.thinMaterial, .thickMaterial, .ultraThin, .ultraThin]
    @State private var count = 1
    @State private var isCountReached = false
    var body: some View {
       
        ZStack{
            Color.clear.ignoresSafeArea()
            VStack(spacing: 10) {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button {
                    changeWords()
                }
            label: {
                Label("Change Stuff", systemImage: "scribble.variable")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 100)
                    .background(.secondary)
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(radius: 50)
                    .buttonBorderShape(.roundedRectangle)

            }.alert("Pressed multiple times!", isPresented: $isCountReached) {
                Button("Ok") {}
            }
                Spacer()
                Spacer()
                Spacer()

                
                VStack(spacing: 20) { 
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "placeholdertext.fill")
                                .padding(.leading,20)  

                            Text(words[0])      
                                .foregroundStyle(.black)
                            Spacer()                                 
                        }
                     Text("Interesting facts about this word.")
                            .padding(.leading,20)
                            .font(.none)
                    }   
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.secondary)
                    .frame(width: 300,height: 100)
                    .background(colors[0])
                    .clipShape(.rect(cornerRadius: 15))
                    .animation(.smooth)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "placeholdertext.fill")
                                .padding(.leading,20)  

                            Text(words[1])     
                                .foregroundStyle(.black)
                            Spacer()                                 
                        }
                     Text("Interesting facts about this word.")
                            .padding(.leading,20)
                            .font(.none)
                    }   
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.secondary)
                    .frame(width: 300,height: 100)
                    .background(colors[1])
                    .clipShape(.rect(cornerRadius: 15))
                    .animation(.smooth)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "placeholdertext.fill")
                                .padding(.leading,20)  

                            Text(words[2])   
                                .foregroundStyle(.black)
                            Spacer()                                 
                        }
                     Text("Interesting facts about this word.")
                            .padding(.leading,20)
                            .font(.none)
                    }   
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.secondary)
                    .frame(width: 300,height: 100)
                    .background(colors[2])
                    .clipShape(.rect(cornerRadius: 15))
                    .animation(.smooth)
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: "placeholdertext.fill")
                                .padding(.leading,20)  

                            Text(words[3])  
                                .foregroundStyle(.black)
                            Spacer()                                 
                        }
                     Text("Interesting facts about this word.")
                            .padding(.leading,20)
                            .font(.none)
                    }   
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.secondary)
                    .frame(width: 300,height: 100)
                    .background(colors[3])
                    .clipShape(.rect(cornerRadius: 15))
                    .animation(.smooth)
                    
              
                    Spacer()
                }
            }
        }
    }
    
    func changeWords() {
        if count < 7 {
            count += 1
            words.shuffle()
            colors.shuffle()
        } else {
            isCountReached = true
            count = 1
        }
    }
}

#Preview {
    PracticeUIView()
}
