//
//  EditProspectView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 7/3/24.
//

import SwiftUI

struct EditProspectView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var prospect: Prospect
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $prospect.name)
                TextField("Email", text: $prospect.emailAddress)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditProspectView(prospect: Prospect(name: "John", emailAddress: "John@abc.vom", isContacted: false))
        .modelContainer(for: Prospect.self)
}
