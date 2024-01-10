//
//  ImageFilterView.swift
//  Instafilter
//
//  Created by Jeevan Mahtani on 9/1/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI



struct ImageFilterView: View {
    @State private var image: Image?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
            
        }
    func loadImage() {
        
        let inputImage = UIImage(resource: .bali)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        
        currentFilter.inputImage = beginImage
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
      //older API wher can use to get available values to set from filter  
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }

      // newer API
      //  currentFilter.radius = 1000
      //  currentFilter.center =  CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        

        guard let outputImage = currentFilter.outputImage else {return }
        guard let CGImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: CGImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ImageFilterView()
}
