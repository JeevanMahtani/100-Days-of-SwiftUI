//
//  SwiftPackageView.swift
//  HotProspects
//
//  Created by Jeevan Mahtani on 1/3/24.
//

import SamplePackage
import SwiftUI

struct SwiftPackageView: View {
    
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
    
}

#Preview {
    SwiftPackageView()
}
