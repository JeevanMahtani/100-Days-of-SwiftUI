//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 23/12/23.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var showAddressLink = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                           scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder(for: order)
                    }
                }
                    .padding()
            }
            
            if showAddressLink {
                NavigationLink("Order details", destination: CustomerAddressView())
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(alertTitle,isPresented: $showingAlert) {
            Button("OK") {
                showAddressLink.toggle()
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    func placeOrder(for _order: Order) async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let(data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            alertTitle = "Thank you!"
            alertMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on the way!"
            showingAlert = true
            order.userAddress = 
            UserAddress(name: order.userAddress.name, streetAddress: order.userAddress.streetAddress, city: order.userAddress.city, zip: order.userAddress.zip)
            
        } catch {
            print("Check out failed \(error.localizedDescription)")
            alertTitle = "Network error"
            alertMessage = "Oops, order failed to send! Please try again."
            showingAlert = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
