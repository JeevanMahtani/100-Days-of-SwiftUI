//
//  Book.swift
//  Bookworm
//
//  Created by Jeevan Mahtani on 27/12/23.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: String 
    var review: String
    var rating: Int
    var date: Date = Date()
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
}


