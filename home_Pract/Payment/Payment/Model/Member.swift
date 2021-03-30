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
    @Published var total : Float
    
    init(name: String, total: Float) {
        self.name = name
        self.total = total
    }
}
