//
//  CupcakesView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 26/12/23.
//

import SwiftUI
struct CupcakesView: View {
    
    @Bindable var order: Order
    @Binding var selectedFlavour: String?
    @State private var tappedImage: String?
    @State private var images = ["vanilla", "strawberry", "chocolate", "rainbow"]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    HStack {
                        ForEach(images, id: \.self) { image in
                            Button(action: {
                                withAnimation {
                                    if tappedImage == image {
                                        tappedImage = nil
                                        selectedFlavour = nil
                                    } else {
                                        tappedImage = image
                                        if let index = images.firstIndex(where: { $0 == image }) {
                                            selectedFlavour = Order.types[index]
                                            order.type = index
                                        }
                                    }
                                }
                            }) {
                                Image("\(image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black.opacity(tappedImage == image ? 1 : 0.3), lineWidth: 2)
                                    )
                            }
                            .buttonStyle(.plain)
                            .scaleEffect(tappedImage == image ? 1.05 : 1.0)
                            .zIndex(tappedImage == image ? 1 : 0)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: geometry.size.width * 0.95, maxHeight: geometry.size.height * 0.16)
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
        }
    }
}

#Preview {
    CupcakesView(order: Order(), selectedFlavour: .constant(Order.types[0]))
}
