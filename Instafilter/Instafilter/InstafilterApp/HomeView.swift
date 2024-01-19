//
//  HomeView.swift
//  Instafilter
//
//  Created by Jeevan Mahtani on 13/1/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct HomeView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.0
    @State private var filterScale = 0.0
    @State private var filterAngle = 0.0
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false

    
    var imageSelected: Bool {
        (processedImage == nil)
    }
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var currentFilter: CIFilter = CIFilter.bumpDistortionLinear()    
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
             
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                        .disabled(imageSelected)
                }
                
                
                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius)
                        .onChange(of: filterRadius, applyProcessing)
                        .disabled(imageSelected)
                }
                
                HStack {
                    Text("Scale")
                    Slider(value: $filterScale)
                        .onChange(of: filterScale, applyProcessing)
                        .disabled(imageSelected)
                }
                
                HStack {
                    Text("Angle")
                    Slider(value: $filterAngle)
                        .onChange(of: filterAngle, applyProcessing)
                        .disabled(imageSelected)
                }
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled(imageSelected)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))               
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize())}
                Button("Edges") { setFilter(CIFilter.edges())}
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur())}
                Button("Pixellate") { setFilter(CIFilter.pixellate())}
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone())}
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask())}
                Button("Pointillize") { setFilter(CIFilter.pointillize())}
                Button("Vignette") { setFilter(CIFilter.vignette())}
                Button("Bump Distortion") { setFilter(CIFilter.bumpDistortionLinear())}
                Button("Cancel", role: .cancel) { }
            }
            .onAppear {
                print(currentFilter.attributes)
            }
        }
    }
    
    func changeFilter() {
        showingFilters.toggle()
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            
            guard let inputImage = UIImage(data: imageData) else { return }        
            
            let beginImage = CIImage(image: inputImage)
            
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains((kCIInputIntensityKey)) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains((kCIInputRadiusKey)) {
            currentFilter.setValue(filterRadius * 50, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains((kCIInputScaleKey)) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        if inputKeys.contains((kCIInputAngleKey)) {
            currentFilter.setValue(filterAngle * 50, forKey: kCIInputAngleKey)
        }

        

            
        
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        if filterCount >= 20 {
            requestReview()
        }
    }
}

#Preview {
    HomeView()
}
