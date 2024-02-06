//
//  ContactPhotoView.swift
//  Confconnect
//
//  Created by Jeevan Mahtani on 4/2/24.
//

import MapKit
import SwiftUI

struct PhotoView: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()  
    }
}

struct NoPhotoView: View {
    var body: some View {
        Text("Unable to display location, ensure locations permission is enabled on your device.")
    }
}

struct ContactPhotoView: View {
    let locationFetcher = LocationFetcher()
    var image: Image
    var contact: Contact
    
    @State private var pickerOptions = ["Photo", "Location"]
    @State private var selectedOption = "Photo"
    
    var body: some View {
        VStack {
            VStack(spacing: 45){
                Picker("", selection: $selectedOption) {
                    ForEach(pickerOptions, id: \.self) { option in
                        Text(option)
                    }
                    
                }       
                .pickerStyle(.segmented)
                .padding(.top, 40)
              
                if selectedOption == "Photo" {
                    PhotoView(image: image)
                } else {
                    if let coordinates = contact.coordinates,
                       let mapPosition = contact.mapPositionBinding,
                       let pinPosition = contact.pinPosition
                    {
                        Map(position: mapPosition) {
                            Annotation(contact.name,  coordinate: pinPosition) {
                                Text(contact.name)
                                    .font(.headline)
                                    .padding()
                                    .background(.blue.gradient)
                                    .foregroundStyle(.white)
                                    .clipShape(.capsule)
                            }
                            .annotationTitles(.hidden)
                        }
                    } else {
                        NoPhotoView()
                    }
                }
            
              Spacer()  
                
            }  
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
        }  
    }
}

#Preview {
    ContactPhotoView(image: Image(systemName: "person.crop.circle.fill"), contact: Contact.example2)
}
