//
//  ItemView.swift
//  CardWallet
//
//  Created by Tuan on 23/03/2021.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var offset: CGFloat
    @StateObject var itemData = ItemViewModel()
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing:5){
                    ForEach(itemData.items) { item in
                        HStack{
                            Text(item.name)
                                .fontWeight(.bold)
                            Spacer()
                            Text(getPrice(value: item.price))
                                .fontWeight(.semibold)
                        }
                    }
                    HStack{
                        Text("Total")
                            .fontWeight(.heavy)
                        Spacer()
                        Text(totalPrice())
                    }
                    .padding(.top,50)
                }
            }
            
            
        }
        
        .padding(.top,80)
    }
    
    func getPrice(value: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currencyAccounting
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    func totalPrice() -> String{
        var price : Float = 0
        itemData.items.forEach{ (item) in
            price += Float(item.price)
        }
        
        return getPrice(value: price)
        
    }
}
