//
//  Card.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//


import SwiftUI



struct Card : Identifiable {
    var id: String
    var name : String
    var image : String
    var position: CGFloat
    var swipe: CGFloat
    var degree : Double
}

class Cards : ObservableObject {
    @Published var brands : [Card]
    
    init() {
        self.brands = []
        
        let card2 = Card(id: "3", name: "Tesco", image: "Tesco-front", position: -20, swipe: 0, degree: 0)
        self.brands.append(card2)
        
        let card1 = Card(id: "2", name: "Boots", image: "Boots-front", position: -10, swipe: 0, degree: 0)
        self.brands.append(card1)
            
        let card = Card(id: "1", name: "Boots", image: "Morrisons-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card)
        
    }
    
    func update(card: Card, value: CGFloat, degree: Double) {
        for i in 0..<brands.count {
            if brands[i].id == card.id {
                brands[i].swipe = value
                brands[i].degree = degree
            }
        }
    }
    
}
