//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 21/11/23.
//

import SwiftUI

struct TestSettingsView: View {
    
    @State private var numOfQuestions = 5
    @State private var numberMultiplication = 1
    @State private var questionNumber = 1
    
    @Binding var questionLibrary: Questions
    @Binding var testDisplayed: Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
                VStack {
                    Text("Test Settings")
                        .font(.title2).bold()
                        .foregroundStyle(.white)
                        .padding(.top)
                    Form {
                        
                        
                        Section("Select a number from 1 to 12") {
                            Stepper("\(numberMultiplication.formatted())", value: $numberMultiplication, in: 1...12, step: 1)
                        }
                        Section("Select the number of questions") {
                            Stepper("\(numOfQuestions.formatted())", value: $numOfQuestions, in: 5...15, step: 5)
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 210)
                    .clipShape(.rect(cornerRadius: 20))
                    .transition(.move(edge: .top))
                    .padding(.horizontal)
                    .padding(.bottom)
                    VStack(spacing: 20) {
        
                        
                        Button(action: {
                            questionLibrary = Questions(numberOfQuestions: numOfQuestions, number: numberMultiplication)
                            dismiss()
                            testDisplayed = true
                        }) {
                            Text("Start Test")
                                .font(.headline)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                                .padding(.horizontal, 20)
                        } 
        
                        Button(action: {
                            dismiss()
                            
                        }) {
                            Text("Close")
                                .font(.headline)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 20)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                                .padding(.horizontal, 20)
                        }                           
                    }
                    Spacer()
                }
                
        }
    }
}

#Preview {
    let questions = Questions(numberOfQuestions: 10, number: 2)
    return TestSettingsView(questionLibrary: .constant(questions), testDisplayed: .constant(false))
}
