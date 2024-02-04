//
//  NameViewModel.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 3/2/24.
//

import Foundation

@Observable
class NameViewModel {
    
    var contact: Contact
    var name: String
    
    init(contact: Contact) {
        self.contact = contact
        self.name = contact.name
    }
    
    func save() -> Contact {
        var newContact = contact
        newContact.name = name
        return newContact
    }
}
