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

//var CardsArr = [
//    Card(id: 1, name: "Morrisons", image: "Morrisons-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 2, name: "Boots", image: "Boots-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 3, name: "Tesco", image: "Tesco-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 4, name: "Iceland", image: "Iceland-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 5, name: "M&S", image: "M&S-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 6, name: "Nectar", image: "Nectar-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 7, name: "Holland&Barrett", image: "Holland&Barrett-front", offx: 0, offy: 0, degree: 0, expand: false),
//    Card(id: 8, name: "Superdrug", image: "Superdrug-front", offx: 0, offy: 0, degree: 0, expand: false),
//]

//@State var data = [
//    Card(id: 1, name: "Morrisons", image: "Morrisons-front", expand: false),
//    Card(id: 2, name: "Boots", image: "Boots-front", expand: false),
//    Card(id: 3, name: "Tesco", image: "Tesco-front", expand: false),
//    Card(id: 4, name: "Iceland", image: "Iceland-front", expand: false),
//    Card(id: 5, name: "M&S", image: "M&S-front", expand: false),
//    Card(id: 6, name: "Nectar", image: "Nectar-front", expand: false),
//    Card(id: 7, name: "Holland&Barrett", image: "Holland&Barrett-front", expand: false),
//    Card(id: 8, name: "Superdrug", image: "Superdrug-front", expand: false),
//]

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
    
//    func update(card: Card, offx: CGFloat, offy: CGFloat, degree: Double) {
//        for i in 0..<brands.count {
//            if brands[i].id == card.id {
//                brands[i].offx = offx
//                brands[i].offy = offy
//                brands[i].degree = degree
//                last = i
//            }
//        }
//    }
//
//    func goBack(index: Int) {
//        brands[index].offx = 0
//    }
    
}
