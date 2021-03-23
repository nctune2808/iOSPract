//
//  ItemViewModel.swift
//  CardWallet
//
//  Created by Tuan on 23/03/2021.
//

import SwiftUI

class ItemViewModel: ObservableObject {
    
    @Published var items = [
        Item(name: "Beef", price: 5, offs: 0, isSwiped: false),
        Item(name: "Chic", price: 4, offs: 0, isSwiped: false),
        Item(name: "Pork", price: 3, offs: 0, isSwiped: false),
        Item(name: "Soup", price: 2, offs: 0, isSwiped: false),
        Item(name: "Milk", price: 1, offs: 0, isSwiped: false)
    ]
}
