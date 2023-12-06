//
//  DummyList.swift
//  MultiplicationTable
//
//  Created by Jeevan Mahtani on 5/12/23.
//

import SwiftUI

struct DummyList: View {
    var body: some View {
        List {
            ForEach(0..<5) { index in
                Text("Item \(index)")
                    .padding(10)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.orange) // Set orange background
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.red, lineWidth: 10) // Set red border
                            )
                    )
                    .padding(5) // Add spacing between list items
            }
        }
    }}

#Preview {
    DummyList()
}
