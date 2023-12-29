//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jeevan Mahtani on 27/12/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    var isNotValidData: Bool {
        title.isEmpty || author.isEmpty || review.isEmpty
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
        
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date())
                        
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(isNotValidData)
                }
            }
            .navigationTitle("Add book")
        }       
    }
}

#Preview {
    AddBookView()
}
