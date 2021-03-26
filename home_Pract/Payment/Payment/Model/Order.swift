//
//  Order.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct Order: Identifiable {
    var id = UUID().uuidString
    var memberName : String
    var product : Product
    var quantity : Int
    var total : Float
}
