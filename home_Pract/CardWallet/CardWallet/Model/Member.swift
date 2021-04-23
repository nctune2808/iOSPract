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
    @Published var total : Double
    @Published var cart : [Cart]
    
    init(name: String,total: Double, cart: [Cart]) {
        self.name  = name
        self.total = total
        self.cart  = cart
    }
}
