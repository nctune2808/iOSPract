//
//  Card.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//


import SwiftUI


class Card : ObservableObject, Identifiable {
    @Published var id : Int
    @Published var name : String
    @Published var image : String
    @Published var expand : Bool
    
    init(id: Int, name: String, image: String, expand: Bool) {
        self.id = id
        self.name = name
        self.image = image
        self.expand = expand
    }
}


