//
//  ExampleList.swift
//  HabitTracker
//
//  Created by Jeevan Mahtani on 23/12/23.
//

import SwiftUI

struct ExampleList: View {
    @State private var someList = [0, 1, 2, 3, 4]
      
      var body: some View {
          List {
              ForEach(someList, id: \.self) { n in
                  Text("\(n)")
                      .foregroundColor(.white)
                      .listRowBackground(
                          RoundedRectangle(cornerRadius: 5)
                              .background(.clear)
                              .foregroundColor(.blue)
                              .padding(
                                  EdgeInsets(
                                      top: 2,
                                      leading: 10,
                                      bottom: 2,
                                      trailing: 10
                                  )
                              )
                      )
                      .listRowSeparator(.hidden)
              }
              .onDelete { idx in
                  someList.remove(atOffsets: idx)
              }
          }
          .listStyle(.plain)
      }
  }

#Preview {
    ExampleList()
}
