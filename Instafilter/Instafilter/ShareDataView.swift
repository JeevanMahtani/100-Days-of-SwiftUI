//
//  ShareDataView.swift
//  Instafilter
//
//  Created by Jeevan Mahtani on 12/1/24.
//

import SwiftUI

struct ShareDataView: View {
    var body: some View {
      //  ShareLink(item: URL(string: "https://hackingwithswift.com")!, subject: //Text("Learn Swift here"), message: Text("Check out 100 Days of SwiftUI"))
        
        let example = Image(.bali)
        
        ShareLink(item: URL(string: "https://hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        ShareLink(item: URL(string: "https://hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        ShareLink(item: example, preview: SharePreview("Bali", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareDataView()
}
