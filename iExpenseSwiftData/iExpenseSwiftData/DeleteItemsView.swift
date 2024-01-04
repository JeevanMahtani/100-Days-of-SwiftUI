//
//  DeleteItemsView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct DeleteItemsView: View {
    
    @State private var numbers = [Int]()
    @State private var number = 1
    var body: some View {
        List {
            ForEach(numbers, id: \.self) {
                Text("Row \($0)")
            }
            .onDelete(perform: removeRows)
        }      
        Button("Add Number") {
            numbers.append(number)
            number += 1
        }
        
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
        print(numbers)
    }
}

#Preview {
    DeleteItemsView()
}
