//
//  IncrementCountView.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 13/12/23.
//

import SwiftUI

struct IncrementCountView: View {
    @State private var isShowing = false
    @State private var count = 0
    var body: some View {
        VStack {
            Text("\(count)")
            Button("Increment") {
                count += 1
                if count == 6 {
                    isShowing.toggle()
                }
            }
        }
        .alert(isPresented: $isShowing) {
            Alert(
                title: Text("Congratulations!"),
                message: Text("You have achieved your target, great job!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    IncrementCountView()
}
