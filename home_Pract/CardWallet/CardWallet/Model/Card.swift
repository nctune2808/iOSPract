//
//  Card.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//


import SwiftUI


struct Card : Hashable {
    let id: Int
    let name : String
    let image : String
    var expand : Bool
}

class Cards : ObservableObject {
    
    @Published var brands = [Card]()
    
    init() {
        self.brands = []
            
        let card1 = Card(id: 1, name: "Morrisons", image: "Morrisons-front", expand: false)
        self.brands.append(card1)
        
        let card2 = Card(id: 2, name: "Boots", image: "Boots-front", expand: false)
        self.brands.append(card2)
        
        let card3 = Card(id: 3, name: "Tesco", image: "Tesco-front", expand: false)
        self.brands.append(card3)
        
        let card4 = Card(id: 4, name: "Iceland", image: "Iceland-front", expand: false)
        self.brands.append(card4)
        
        let card5 = Card(id: 5, name: "M&S", image: "M&S-front", expand: false)
        self.brands.append(card5)
        
        let card6 = Card(id: 6, name: "Nectar", image: "Nectar-front", expand: false)
        self.brands.append(card6)
        
        let card7 = Card(id: 7, name: "Holland&Barrett", image: "Holland&Barrett-front", expand: false)
        self.brands.append(card7)
        
        let card8 = Card(id: 8, name: "Superdrug", image: "Superdrug-front", expand: false)
        self.brands.append(card8)

    }
    
}
