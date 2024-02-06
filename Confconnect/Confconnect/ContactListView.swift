//
//  ContactListView.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 3/2/24.
//

import PhotosUI
import SwiftUI

struct ContactListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable var viewModel: ContactViewModel

    var body: some View {
        NavigationStack {
            Form {
                List {
                    ForEach(viewModel.contacts.sorted()) { contact in
                        NavigationLink(destination: ContactPhotoView(image: contact.image ?? Image(systemName: "person.crop.circle.fill"), contact: contact)) {
                            HStack {
                                contact.image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)  
                                    .frame(width: 100, height: 100)   
                                    .clipped()
                                    .cornerRadius(10)
                                
                                VStack {
                                    Text(contact.name)
                                }
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.deleteContact(at: indexSet)
                    })
                }
            }
        }
    }
}

#Preview {
    let viewModel = ContactViewModel(forPreview: true)
    return  ContactListView(viewModel: viewModel)
}
