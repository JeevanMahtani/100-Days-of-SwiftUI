//
//  GridScrollView.swift
//  Moonshot
//
//  Created by Jeevan Mahtani on 27/11/23.
//

import SwiftUI

struct GridScrollView: View {
    
    /*  let layout = [
     GridItem(.fixed(80)),
     GridItem(.fixed(80)),
     GridItem(.fixed(80)),
     ]*/
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))]
    var body: some View {
        ScrollView(.horizontal) {
          /*  LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            } */
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    GridScrollView()
}
