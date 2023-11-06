//
//  BundleView.swift
//  WordScramble
//
//  Created by Jeevan Mahtani on 5/11/23.
//

import SwiftUI

struct BundleView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "someFile", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: fileURL) {
                //file loaded into a string
            }
        }
    }
}
#Preview {
    BundleView()
}
