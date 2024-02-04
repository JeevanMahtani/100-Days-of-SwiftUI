//
//  ContentView.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 1/2/24.
//

import PhotosUI
import SwiftUI

struct HomeView: View {
    @State private var viewModel = ContactViewModel()
    @State private var showingPhotoPicker = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.contacts.isEmpty {
                    PhotosPicker(selection: $viewModel.selectedItem) {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                } else {
                    ContactListView(viewModel: viewModel)
                }
            }
            .navigationTitle("Conf Connect")    
            .buttonStyle(.plain)
            .toolbar {
                if !viewModel.contacts.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            PhotosPicker(selection: $viewModel.selectedItem, matching: .images) {
                                Image(systemName: "plus")
                                    .imageScale(.large)
                                    .accessibility(label: Text("Add Photo"))
                            }
                        }
                        .padding(10)
                    }
                }
            }
            .onChange(of: viewModel.selectedItem) {
                Task {
                    await viewModel.loadPhoto()
                }
            }
            .sheet(isPresented: $viewModel.isUploaded) {
                let contact = viewModel.createContact()
                NameView(contact: contact) {
                    if let uploadedImage = viewModel.uploadedImage {
                        viewModel.save($0, image: uploadedImage)
                    }
                }

            }
        }
        .padding()

    }
}

#Preview {
    HomeView()
}
