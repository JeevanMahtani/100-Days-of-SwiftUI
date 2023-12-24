//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 22/12/23.
//

import Foundation


struct UserAddress: Codable {
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}

@Observable
class Order: Codable {
    
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _userAddress = "userAddress"
    }

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false		
 
    var userAddress: UserAddress {
        didSet {
            if let encoded = try? JSONEncoder().encode(userAddress) {
                UserDefaults.standard.set(encoded, forKey: "UserAddress")
            }
        }
    }
    
    init() {
        if let address = UserDefaults.standard.data(forKey: "UserAddress") {
            if let decodedItems = try? JSONDecoder().decode(UserAddress.self, from: address) {
                userAddress = decodedItems
                return
            }
        }  
       userAddress = UserAddress()
    }
    
    var hasValidAddress: Bool {
        
        if userAddress.name.isEmpty || userAddress.streetAddress.isEmpty || userAddress.city.isEmpty || userAddress.zip.isEmpty {
            return false
        }
        
        if userAddress.name.containsOnlyWhitespace() || userAddress.streetAddress.containsOnlyWhitespace() || userAddress.city.containsOnlyWhitespace() || userAddress.zip.containsOnlyWhitespace() {
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        //$2 per cake
        var cost = Decimal(quantity * 2)
        
        //complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frosting        
        if extraFrosting {
            cost += Decimal(quantity)
        }
        if addSprinkles { 
            // $0.50/cake for extra sprinkles
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}

extension String {
    func containsOnlyWhitespace() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
