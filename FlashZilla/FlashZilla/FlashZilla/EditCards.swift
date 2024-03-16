//
//  EditCards.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 14/3/24.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel = CardViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add one card") {
                    TextField("Prompt", text: $viewModel.newPrompt)
                    TextField("Answer", text: $viewModel.newAnswer)
                    Button("Add Card", action: viewModel.addCard)
                }
                
                Section {
                    ForEach(0..<viewModel.cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(viewModel.cards[index].prompt)
                                .font(.headline)
                            
                            Text(viewModel.cards[index].answer)
                                .foregroundStyle(.secondary)
                        }    
                    }
                    .onDelete(perform: viewModel.removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    EditCards()
}
