//
//  Cart.swift
//  Payment
//
//  Created by Tuan on 27/03/2021.
//

import SwiftUI

class Cart: ObservableObject, Identifiable {
    var id = UUID().uuidString
    @Published var productCart : Product
    @Published var isChosen : Bool
    
    init(productCart: Product, isChosen : Bool) {
        self.productCart = productCart
        self.isChosen = isChosen
    }
}

