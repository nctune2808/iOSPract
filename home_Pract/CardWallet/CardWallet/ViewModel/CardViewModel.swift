//
//  CardViewModel.swift
//  CardWallet
//
//  Created by Tuan on 23/04/2021.
//

import SwiftUI

class CardViewModel : ObservableObject {
    
    @Published var brands = [Card]()
    
    init() {
        self.brands = [
            
            Card(id: 1, name: "Morrisons", image: "Morrisons-front", expand: false),
            
            Card(id: 2, name: "Boots", image: "Boots-front", expand: false),
            
            Card(id: 3, name: "Tesco", image: "Tesco-front", expand: false),
            
            Card(id: 4, name: "Iceland", image: "Iceland-front", expand: false),
            
            Card(id: 6, name: "Nectar", image: "Nectar-front", expand: false),
            
            Card(id: 7, name: "Holland&Barrett", image: "Holland&Barrett-front", expand: false),
            
            Card(id: 8, name: "Superdrug", image: "Superdrug-front", expand: false),
        
        ]
    }
    
}
