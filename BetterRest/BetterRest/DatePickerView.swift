//
//  DatePickerView.swift
//  BetterRest
//
//  Created by Jeevan Mahtani on 2/11/23.
//

import SwiftUI

struct DatePickerView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        
        DatePicker("Please enter a date", selection: $wakeUp)

        
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
        
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden()
        
        
        DatePicker("Please enter a date", selection: $wakeUp)
            .labelsHidden()
        
        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        Text(Date.now, format: .dateTime.hour().minute())
    }
    
    func exampleDates() {
      /*  var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now*/
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    DatePickerView()
}
