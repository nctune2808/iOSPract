//
//  Member.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

class Member: ObservableObject, Identifiable {
    var id = UUID().uuidString
    @Published var name : String
    var total : Float = 0.0
    @Published var cart : [Cart]
    
    init(name: String,cart: [Cart]) {
        self.name = name
        self.cart = cart
    }
}
