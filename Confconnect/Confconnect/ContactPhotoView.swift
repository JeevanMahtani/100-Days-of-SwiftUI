//
//  ContactPhotoView.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 4/2/24.
//

import SwiftUI

struct ContactPhotoView: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    ContactPhotoView(image: Image(systemName: "person.crop.circle.fill"))
}
