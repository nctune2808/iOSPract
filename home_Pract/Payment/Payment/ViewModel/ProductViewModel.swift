//
//  ProductViewModel.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

class ProductViewModel: ObservableObject{
    
    @Published var productData = [Product]()
    
    init() {
        self.productData = [
            Product(name: "Beef",   price:10, repeated: 0),
            Product(name: "Turkey", price: 9, repeated: 0),
            Product(name: "Chicken",price: 8, repeated: 0),
            Product(name: "Lamb",   price: 7, repeated: 0),
            Product(name: "Pork",   price: 6, repeated: 0),
            Product(name: "Eggs",   price: 5, repeated: 0),
            Product(name: "Milk",   price: 4, repeated: 0),
            Product(name: "Eggs",   price: 3, repeated: 0),
            Product(name: "Snack",  price: 2, repeated: 0),
            Product(name: "Bread",  price: 1, repeated: 0)
        ]
    }
}
