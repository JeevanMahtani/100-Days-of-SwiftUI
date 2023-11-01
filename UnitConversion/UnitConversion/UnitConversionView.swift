//
//  ContentView.swift
//  UnitConversion
//
//  Created by Jeevan Mahtani on 26/10/23.
//

import SwiftUI

struct UnitConversionView: View {
    
    @State private var input = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Farenheit"
    
    var output: Double {
        return convertInput(inputUnit, outputUnit, amount: input)
    }
    
    var units = ["Celsius", "Farenheit", "Kelvin"]
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    TextField("Enter amount", value: $input, format: .number)
                        .keyboardType(.numberPad)
                }
                
                Picker("From", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("To", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                
                Section("Output") {
                    Text(output, format: .number)
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

private func convertInput(_ inputUnit: String, _ outputUnit: String, amount: Double) -> Double {
    switch(inputUnit) {
    case "Celsius":
        return from(celsius: amount, to: outputUnit)
    case "Kelvin":
        return from(kelvin: amount, to: outputUnit)
    case "Farenheit":
        return from(farenheit: amount, to: outputUnit)
    default:
        return 0.0
    }   
}

private func from(celsius: Double, to: String) -> Double {
    switch(to) {
    case "Farenheit":
        return (celsius * 1.8) + 32
    case "Kelvin":
        return celsius + 273.15
    default:
        return celsius
    }
}

private func from(farenheit: Double,to: String) -> Double {
    switch(to) {
    case "Celsius":
        return (farenheit - 32) / 1.8
    case "Kelvin":
        return ((farenheit - 32) / 1.8) + 273.15
    default:
        return farenheit
    }
}

private func from(kelvin: Double,to: String) -> Double {
    switch(to) {
    case "Celsius":
        return kelvin - 273.15
    case "Farenheit":
        return ((kelvin - 273.15) * 1.8) + 32
    default:
        return kelvin
    }
}

#Preview {
    UnitConversionView()
}
