//
//  CustomerAddressView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 24/12/23.
//

import SwiftUI

struct CustomerAddressView: View {
    @State private var addresses = Addresses()
    var body: some View {
        NavigationStack {
            VStack {
                List(addresses) { address in
                    VStack(alignment: .leading) {
                        Text(address.name)
                        Text(address.streetAddress)
                        Text(address.city)
                        Text(address.zip)
                    }
                }
            }
        } 
    }
}

#Preview {
    CustomerAddressView()
}
