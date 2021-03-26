//
//  Member.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct Member: Identifiable {
    var id = UUID().uuidString
    var name : String
    var isExceeded = false
}
