//
//  ProgressorView.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 31/1/24.
//

import SwiftUI

extension View {

    @ViewBuilder
    public func `if`<T: View, U: View>(
        _ condition: Bool,
        then modifierT: (Self) -> T,
        else modifierU: (Self) -> U
    ) -> some View {

        if condition { modifierT(self) }
        else { modifierU(self) }
    }
}

struct ProgressorView: View {
    @State private var progressValue = 0.0
    @State private var vertical = -150.0
    @State private var horizontal = 0.0
    @State private var indicatorPosition = 0.0
    @State private var rotationEnabled = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.gray)
            
            Circle()
                .trim(from: 0.0, to: progressValue)
                .stroke(lineWidth: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .rotationEffect(.degrees(270))
            VStack {  
                Circle()
                    .frame(width: 30, height: 30)
                    .offset(x: horizontal, y: vertical)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .if(rotationEnabled) { view in
                           view.rotationEffect(Angle(degrees: indicatorPosition))
                    } else: { $0 } 
            }       
        }
        .frame(width: 300, height: 400)

        
        Button("Increase") {
            withAnimation(.snappy(duration: 1.5)) {
                progress()
       
            }
        }
        
        Button("Reset") {
            withAnimation(nil) {    
                progressValue = 0.0
                indicatorPosition = 0.0
            }
        }
    }
    
    func progress () {
        guard progressValue != 1.0 else { return }
        if indicatorPosition > 360.0 {
            rotationEnabled = false
 
        } else {
            indicatorPosition += 90
        }        
        progressValue += 0.25
    }
}

#Preview {
    ProgressorView()
}
