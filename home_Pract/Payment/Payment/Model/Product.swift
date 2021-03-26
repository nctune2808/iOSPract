//
//  Product.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID().uuidString
    var name : String
    var price : Float
    
}
