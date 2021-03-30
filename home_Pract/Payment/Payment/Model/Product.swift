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
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}
