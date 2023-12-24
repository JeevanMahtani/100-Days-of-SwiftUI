//
//  CustomerAddressView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 24/12/23.
//

import SwiftUI

struct CustomerAddressView: View {
    var order: Order
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(order.userAddress.name)")
                        .font(.title2)
                    Text("Street Address: \(order.userAddress.streetAddress)")
                        .font(.title2)
                    Text("City: \(order.userAddress.city)")
                        .font(.title2)
                    Text("Zip: \(order.userAddress.zip)")
                        .font(.title2)
                }
                .navigationTitle("User details")
            }
        } 
    }
}

#Preview {
    var address = UserAddress(name: "Tom", streetAddress: "123 cupcake street", city: "London", zip : String(123))
    var order = Order()
    order.userAddress = address
    return CustomerAddressView(order: order)
}
