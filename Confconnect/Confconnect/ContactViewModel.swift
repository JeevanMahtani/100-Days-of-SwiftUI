//
//  Contact.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 1/2/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct Contact: Identifiable, Codable, Comparable {
    
    var id: UUID
    var name: String
    var imagePath: String?
    
    var image: Image? {
        guard let imagePath = imagePath, 
              let fileURL = URL(string: imagePath), 
              let uiImage = UIImage(contentsOfFile: fileURL.path) else {
            return Image(systemName: "person.crop.circle.fill")
        }
        return Image(uiImage: uiImage)
    }
    
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
    
#if DEBUG
    static let example = Contact(id: UUID(), name: "Test Contact")
#endif
}


@Observable
class ContactViewModel: Identifiable {
    private(set) var contacts: [Contact]
    let savePath = URL.documentsDirectory.appending(path: "SavedContacts")
    var uploadedImage: UIImage?
    var selectedItem: PhotosPickerItem?
    var isUploaded: Bool = false
    
    init(forPreview: Bool = false) {
        if forPreview {
            self.contacts = [Contact.example]
        } else {
            do {
                let data = try Data(contentsOf: savePath)
                contacts = try JSONDecoder().decode([Contact].self, from: data)
                
            } catch {
                contacts = []
            }
        }
    }
    
    func saveContacts() {
        do {
            let data = try JSONEncoder().encode(contacts)
            try data.write(to:savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func createContact() -> Contact {
        Contact(id: UUID(), name: "")
    }
    
    func deleteContact(at offsets: IndexSet) {
        for index in offsets {
            if let imagePath = contacts[index].imagePath, 
               let fileURL = URL(string: imagePath) {
                do {
                    try FileManager.default.removeItem(at: fileURL)
                } catch {
                    print("Could not delete image file: \(error.localizedDescription)")
                }
            }
        }
        contacts.remove(atOffsets: offsets)
        saveContacts()
    }
        
    func loadPhoto() async {
        uploadedImage = nil          
        if let imageData =  try? await self.selectedItem?.loadTransferable(type: Data.self) {
           uploadedImage = UIImage(data: imageData)
            isUploaded.toggle()
        }
    }
    
    func save(_ contact: Contact, image: UIImage) {
        guard let imageData = image.pngData() else { return }
        let contactId = UUID()
        let fileName = contact.name + "_" + ("\(contactId)").lowercased() + ".png"
        let fullPath = URL.documentsDirectory.appendingPathComponent(fileName)

        do {
            let newContact = Contact(id: contactId, name: contact.name, imagePath: fullPath.absoluteString)
            contacts.append(newContact)
            try imageData.write(to: fullPath, options: [.atomic, .completeFileProtection])
            saveContacts()
        } catch {
            print("Unable to save contact: \(error.localizedDescription)")
        }
    }
}
