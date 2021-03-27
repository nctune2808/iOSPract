//
//  Cart.swift
//  Payment
//
//  Created by Tuan on 27/03/2021.
//

import SwiftUI

struct Cart: Identifiable, Hashable {
    var id = UUID().uuidString
    var memberName : String
    var memberProduct : String
    var total : Float = 0.00
    
}

