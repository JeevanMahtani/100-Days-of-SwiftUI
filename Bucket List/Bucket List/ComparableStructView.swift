//
//  ContentView.swift
//  Bucket List
//
//  Created by Jeevan Mahtani on 19/1/24.
//

import SwiftUI

struct User: Identifiable, Comparable {

    let id = UUID()
    var firstName: String
    var lastname: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastname < rhs.lastname
    }    
}

struct ComparableStructView: View {
    
    let users = [
    User(firstName: "Tom", lastname: "Penny"),
    User(firstName: "Peter", lastname: "Griffin"),
    User(firstName: "Jake", lastname: "Chaplan")]
        .sorted()
    var body: some View {
        Button("Read and write") {
            FileManager.default.write(data: "Test 222", fileName: "message.txt")
            let result: String = FileManager.default.read("message.txt")
            print(result)
            /*let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
             */
        }
    }
    
   
}

#Preview {
    ComparableStructView()
}
