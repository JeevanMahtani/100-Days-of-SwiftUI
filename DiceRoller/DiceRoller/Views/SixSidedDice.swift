//
//  SixSidedDice.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import SwiftUI

struct SixSidedDice: View {
    @Binding var number: Int
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        ZStack {
            Rectangle()            
                .stroke(.black, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: width, height: height)
            
            Text("\(number)")
                .foregroundStyle(.red)
                .bold()
                .font(.largeTitle)
        }  
    }
}

#Preview {
    SixSidedDice(number: .constant(1), width: 150, height: 150)
}
