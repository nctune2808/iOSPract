//
//  Account.swift
//  MVVM
//
//  Created by Tuan on 21/02/2021.
//

import Foundation

struct Account: Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
}
