//
//  Card.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//


import SwiftUI



struct Card : Identifiable {
    var id: Int
    var name : String
    var image : String
    var position: Int
    var swipe: CGFloat
    var degree : Double
}

var CardsArr = [
    Card(id: 3, name: "Tesco", image: "Tesco-front", position: -20, swipe: 0, degree: 0),
    Card(id: 2, name: "Boots", image: "Boots-front", position: -10, swipe: 0, degree: 0),
    Card(id: 1, name: "Morrisons", image: "Morrisons-front", position: 0, swipe: 0, degree: 0)
]

class Cards : ObservableObject {
    @Published var brands = [Card]()
    @Published var last = -1
    
    init() {
        self.brands = []
        
        let card8 = Card(id: 8, name: "Superdrug", image: "Superdrug-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card8)
        
        let card7 = Card(id: 7, name: "Holland&Barrett", image: "Holland&Barrett-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card7)
        
        let card6 = Card(id: 6, name: "Nectar", image: "Nectar-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card6)
        
        let card5 = Card(id: 5, name: "M&S", image: "M&S-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card5)
        
        let card4 = Card(id: 4, name: "Iceland", image: "Iceland-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card4)
        
        let card3 = Card(id: 3, name: "Tesco", image: "Tesco-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card3)
        
        let card2 = Card(id: 2, name: "Boots", image: "Boots-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card2)
            
        let card1 = Card(id: 1, name: "Morrisons", image: "Morrisons-front", position: 0, swipe: 0, degree: 0)
        self.brands.append(card1)
        
    }
    
    func update(card: Card, value: CGFloat, degree: Double) {
        for i in 0..<brands.count {
            if brands[i].id == card.id {
                brands[i].swipe = value
                brands[i].degree = degree
                last = i
            }
        }
    }
    
    func goBack(index: Int) {
        brands[index].swipe = 0
    }
    
}
