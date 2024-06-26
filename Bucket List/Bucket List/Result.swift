//
//  Result.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 24/1/24.
//

import Foundation

struct Result: Codable {
    let query: Query
}


struct Query: Codable {
    let pages: [Int: Page]
}


struct Page: Codable, Comparable {
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
}
