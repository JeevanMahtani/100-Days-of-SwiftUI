//
//  HideGroupAccessibilityView.swift
//  AccessibilitytSandbox
//
//  Created by Jeevan Mahtani on 28/1/24.
//

import SwiftUI

struct HideGroupAccessibilityView: View {
    var body: some View {
        Image(decorative:"ales-krivec-15949")
            .accessibilityHidden(true)
        
        VStack {
            Text("Your score is")
            Text("100")
        }
        .accessibilityElement(children: .ignore)
      //  .accessibilityLabel("Your score is 100")
    }
    
  
}

#Preview {
    HideGroupAccessibilityView()
}
