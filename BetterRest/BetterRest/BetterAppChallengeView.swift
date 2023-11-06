//
//  BetterAppView.swift
//  BetterRest
//
//  Created by Jeevan Mahtani on 3/11/23.
//

import CoreML
import SwiftUI

struct BetterAppChallengeView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isShowingErrorAlert = false
    
    var idealBedtime: Date? {
        
        var idealTime: Date? = nil
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            idealTime = wakeUp - prediction.actualSleep
            

        } catch {
            isShowingErrorAlert = true
        }
        return idealTime ?? .now
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?"){
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section("Daily coffee intake") {
                   // Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    Picker("Cups of Coffee",selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text($0 == 1 ? "1 cup" : "\($0) cups")
                        }
                    }
                }
                
                Section("Ideal bedtime") {
                    Text(idealBedtime?.formatted(.dateTime.hour().minute()) ?? "Error retrieving ideal bedtime")
                        .font(.largeTitle)
                        .foregroundColor(idealBedtime == nil ? .red : .primary)

                }
                
            }
            .navigationTitle("BetterRest")
        }
    }
}

#Preview {
    BetterAppChallengeView()
}

