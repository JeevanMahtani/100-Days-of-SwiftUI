//
//  SheetView.swift
//  iExpense
//
//  Created by Jeevan Mahtani on 24/11/23.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    var body : some View {
        Text("Hello \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct SheetView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") { 
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Jeevan")
        }
    }
}


#Preview {
    SheetView()
}
