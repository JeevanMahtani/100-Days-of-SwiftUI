//
//  CustomSegmentedPicker.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 31/1/24.
//

import SwiftUI

struct Option: Identifiable {
    var id: Int
    var isSelected: Bool = false
    var offset: Double = 0.0
}

struct CustomSegmentedPicker: View {

    @State private var buttonProperties = [Option]()
    @State private var buttonOffsets: [Double] = [-127.0, -42.0, 43.0, 128.0]    
    @State private var controlPosition = -127.0
    
    init() {
        var initialButtons = Array(0...3).map { Option(id: $0, isSelected: false) }
        initialButtons[0].isSelected = true
        _buttonProperties = State(initialValue: initialButtons)
    }

    var buttons: [Option] {
        zip(buttonProperties, buttonOffsets).map { (button, offset) in
            var newButton = button        
            newButton.offset = offset
            return newButton
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 50)
                .foregroundStyle(.red)
                .border(.red, width: 5)
                .clipShape(.rect(cornerRadius: 10.0))
        
            Rectangle()
                .frame(width: 90, height: 43)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10.0))
                .offset(x: controlPosition)
                .animation(.easeInOut)
            
            HStack(spacing: 35) {
                ForEach(buttons) { button in 
                    Button("Option") {
                        controlPosition = button.offset
                        updateTextColor(for: button)
                    }
                    .foregroundStyle(button.isSelected ? Color.red : Color.white)
                }
                .buttonStyle(.plain)    
            }   
        }
    }
    
    func updateTextColor(for button: Option) {
        for i in 0..<buttonProperties.count {
            buttonProperties[i].isSelected = (buttonProperties[i].id == button.id)
        }
    }    
}

#Preview {
    CustomSegmentedPicker()
}
