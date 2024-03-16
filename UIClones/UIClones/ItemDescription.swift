//
//  ItemDescription.swift
//  UIClones
//
//  Created by Jeevan Mahtani on 13/3/24.
//

import SwiftUI

extension ItemDescription {
    static let content = 
"""
British shorthair cats are one of the oldest recognized cat breeds, first thought to have been brought to Britain by the Romans. Prized for their soft, plush coats and rounded bodies, British shorthairs could almost be mistaken for living teddy bears.
"""
}

struct ItemDescription: View {
    
    var body: some View {
        VStack(spacing: 8) {
            VStack {
                Image(.shorthair)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 300)
                    
                  
            }
            
            Text("British Short Hair")
                .font(.title)
            
            Rectangle()
                .fill(Color.black.opacity(0.4))
                .frame(width: 380, height: 2)
                .padding(.horizontal)
            
            VStack {
                Text("\(ItemDescription.content)")
                    .font(.subheadline)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                
            } label : {
                Text("Share")
                    .frame(width: 200)
                    .font(.system(size: 24))
                    .padding()
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(.capsule)
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
    }
    
}

#Preview {
    ItemDescription()
}
