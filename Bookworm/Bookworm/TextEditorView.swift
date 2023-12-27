//
//  TextEditorView.swift
//  Bookworm
//
//  Created by Jeevan Mahtani on 26/12/23.
//

import SwiftUI

struct TextEditorView: View {
    @AppStorage("Notes") private var notes = ""
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $notes)
               
                
             
            }
            
        }
    }
}

#Preview {
    TextEditorView()
}
