//
//  StudentView.swift
//  Bookworm
//
//  Created by Jeevan Mahtani on 26/12/23.
//

import SwiftData
import SwiftUI

struct StudentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
   
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)    
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Harry", "Ginny", "Hermione", "Luna", "Ron"]
                    
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasely"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    StudentView()
}
