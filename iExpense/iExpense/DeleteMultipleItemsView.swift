//
//  DeleteItemsView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct DeleteMultipleItemsView: View {
    
    @State private var numbers = [Int]()
    @State private var number = 1
    var body: some View {
        NavigationStack {
            VStack {
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
            .toolbar {
                EditButton()
            }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
        print(numbers)
    }
}

#Preview {
    DeleteMultipleItemsView()
}
