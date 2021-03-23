//
//  Item.swift
//  CardWallet
//
//  Created by Tuan on 23/03/2021.
//

import SwiftUI

struct Item: Identifiable{
    
    var id = UUID().uuidString
    var name : String
    var price: Float
    var offs: CGFloat
    var isSwiped: Bool
    
    
}
