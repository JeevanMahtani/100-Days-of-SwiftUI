//
//  ToolbarCustomizeButtonView.swift
//  Navigation
//
//  Created by Jeevan Mahtani on 7/12/23.
//

import SwiftUI

struct ToolbarCustomizeButtonView: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap me") {}
                        Button("Tap me") {}
                    }

                }   
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ToolbarCustomizeButtonView()
}
