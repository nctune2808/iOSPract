//
//  Product.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

class Product: ObservableObject, Identifiable {
    var id = UUID().uuidString
    @Published var name : String
    @Published var price : Float
    @Published var repeated: Int
    
    init(name: String, price: Float, repeated: Int) {
        self.name = name
        self.price = price
        self.repeated = repeated
    }
}
