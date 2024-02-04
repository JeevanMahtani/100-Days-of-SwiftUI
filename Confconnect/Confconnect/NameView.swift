//
//  NameView.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 1/2/24.
//

import SwiftUI

struct NameView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: NameViewModel
    
    var onSave: (Contact) -> Void
    
    var body: some View {
        NavigationStack { 
            Form {
                TextField("Photo Description", text: $viewModel.name)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newContact = viewModel.save()
                        onSave(newContact)
                        dismiss()
                    }
                }
            }
        }
    }
    
    init( contact: Contact, onSave: @escaping (Contact) -> Void) {
        self.onSave = onSave
        _viewModel = State(initialValue: NameViewModel(contact: contact))
 
    }
}

#Preview {
    NameView(contact: .example, onSave:{ _ in })
}
