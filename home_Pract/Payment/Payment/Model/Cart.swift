//
//  Cart.swift
//  Payment
//
//  Created by Tuan on 27/03/2021.
//

import SwiftUI

class Cart: ObservableObject, Identifiable {
    var id = UUID().uuidString
//    @Published var memberCart : Member
    @Published var productCart : Product
    
    
    init(productCart: Product) {
//        self.memberCart = memberCart
        self.productCart = productCart
    }
}

