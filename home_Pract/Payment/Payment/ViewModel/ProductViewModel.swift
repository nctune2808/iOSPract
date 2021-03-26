//
//  ProductViewModel.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

class ProductViewModel: ObservableObject{
    
    @Published var items = [
        Product(name: "Beef", price: 10),
        Product(name: "Pork", price: 8),
        Product(name: "Eggs", price: 6),
        Product(name: "Milk", price: 4)
    ]
}
