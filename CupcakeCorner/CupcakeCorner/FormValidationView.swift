//
//  FormValidationView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 20/12/23.
//

import SwiftUI

struct FormValidationView: View {
   @State private var username = ""
   @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5  || email.count < 5
    }
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") { }
                    .disabled(disableForm)
            }
        }
    }
}

#Preview {
    FormValidationView()
}
