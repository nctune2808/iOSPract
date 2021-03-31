//
//  CartViewModel.swift
//  Payment
//
//  Created by Tuan on 30/03/2021.
//

import SwiftUI

class CartViewModel: ObservableObject{
    @Published var cartData = [Cart]()
    
    init() {
        self.cartData = []
    }
}
