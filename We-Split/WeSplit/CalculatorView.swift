//
//  CalculatorView.swift
//  WeSplit
//
//  Created by Jeevan Mahtani on 24/10/23.
//

import SwiftUI

struct CalculatorView: View {
    
    @State private var input: Int = 0
    
    @State private var result: Int = 0

    var body: some View {
        NavigationStack {
            
            HStack {
                Button("+") {
                    result += input
                }
                .font(.title)
                .padding(.leading)
                Spacer()
               Button("-") {
                    result -= input
                } 
//                        .font(.title)
//                        .padding(.leading)
//                        Spacer()
//                        Button("x") {
//                            result *= input
//                        } 
//                        .font(.title)
//                        .padding(.leading)
//                        Spacer()
//                        Button("/") {
//                            result /= input
//                        } 
//                        .font(.title)
//                        .padding(.leading)
           }
            Form {
                Section("Amount") {
                    TextField("Enter a number", value: $input,
                              format: .number)
                }
                .keyboardType(.numberPad)

                
                
               
                Section("Result") {
                    Text("Result: \(result)")
                }
                    
            
            }
            .navigationTitle("Simple Calculator")
        }
    }
}

#Preview {
    CalculatorView()
}
