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
            Product(name: "Beef", price: 10),
            Product(name: "Turkey", price: 9),
            Product(name: "Chicken", price: 8),
            Product(name: "Lamb", price: 7),
            Product(name: "Pork", price: 6),
            Product(name: "Eggs", price: 5),
            Product(name: "Milk", price: 4),
            Product(name: "Eggs", price: 3),
            Product(name: "Snack", price: 2),
            Product(name: "Bread", price: 1)
        ]
    }
}
