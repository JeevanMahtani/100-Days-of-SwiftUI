//
//  OrderView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 22/12/23.
//

import SwiftUI

struct OrderView: View {
    
    @State private var order = Order()
    @State private var selectedFlavour: String? = ""
    var body: some View {
        NavigationStack {
            Form {
               
                Section("Select a flavour") {
                    CupcakesView(order: order, selectedFlavour: $selectedFlavour)
                        .frame(height: 100)
                    
                    HStack {
                        Text("Selected flavour")
                        Spacer()
                        Text(selectedFlavour ?? "")
                    }

                }
                Section {
               
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    OrderView()
}
