//
//  ChoiceButtonView.swift
//  RockPaperScissors
//
//  Created by Jeevan Mahtani on 2/11/23.
//

import SwiftUI

struct ChoiceButtonView: View {
    var item: Int = 0
    var images = [String]()
    var action: (Int) -> Void
    var body: some View {
        Button {
            action(item)
        } label : {
            Image(systemName: images[item])
                .font(.title3)
                .padding()
                .foregroundStyle(.white)
                .frame(width: 200, height: 50)
                .background(.clear)
                .border(.ultraThickMaterial,width: 3)
                .cornerRadius(5)
        }
    }
}
