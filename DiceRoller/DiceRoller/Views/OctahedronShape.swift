//
//  OctahedronShape.swift
//  DiceRoller
//
//  Created by Jeevan Mahtani on 26/3/24.
//

import SwiftUI
import Prism

struct OctahedronShape: View {
    
    @State var config = PrismConfiguration(
            tilt: 0.8,
            size: CGSize(width: 50, height: 50), 
            extrusion: 58, 
            levitation: 10, 
            shadowColor: Color.black, 
            shadowOpacity: 0.25 
        )
    
    var body: some View {
        PrismCanvas(tilt: config.tilt) {
            PrismView(configuration: config) {
                ZStack {
                    Color.white
                        .border(.black)

                    Circle()
                        .fill(Color.red)
                        .frame(width: 25, height: 25)
                        
                }
            }left: {
                ZStack {
                    Color.white
                        .border(.black)
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10) 
                                .offset(x: 8, y: 4)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10) 
                                .offset(x: -10, y: 4)
                        }
                    }
                }
            } right: {
                ZStack {
                    Color.white
                        .border(.black)
                 
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10)
                                .offset(x: 12, y: 4)
                        }
                        
                        HStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10)
                        }
                        
                        HStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10)
                                .offset(x: -12, y: -3)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    OctahedronShape()
}
