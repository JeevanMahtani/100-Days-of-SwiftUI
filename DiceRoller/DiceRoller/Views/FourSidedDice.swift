//
//  FourSidedDice.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 25/3/24.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct FourSidedDice: View {
    @Binding var number: Int
    var width: CGFloat
    var height: CGFloat
    var body : some View {
        ZStack {
            Triangle()            
                .stroke(.black, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: width, height: height)
            
            Text("\(number)")
                .foregroundStyle(.red)
                .offset(y: 20)
                .bold()
                .font(.largeTitle)
        }  
    }
}
    
    #Preview {
        FourSidedDice(number: .constant(1), width: 150, height: 150)
    }
