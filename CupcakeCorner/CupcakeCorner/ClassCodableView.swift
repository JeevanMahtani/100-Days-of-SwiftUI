//
//  ClassCodableView.swift
//  CupcakeCorner
//
//  Created by Jeevan Mahtani on 22/12/23.
//

import SwiftUI

@Observable
class User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
}

struct ClassCodableView: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ClassCodableView()
}
