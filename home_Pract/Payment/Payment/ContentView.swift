//
//  ContentView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var myCart = shoppingCart
    @State var members = memberList

    var body: some View {

        VStack{
            
            ForEach(myCart) { item in
                HStack{
                    Text(item.name)
                    Spacer()
                    Text("\(item.price)")
                    Spacer()
                    Text(item.assign)
                        .contextMenu(ContextMenu(menuItems: {
                            ForEach(members) { member in
                                Button(action: {
                                    if let index = myCart.firstIndex(where: {$0.name == "\(item.name)"}) {
                                        myCart[index].assign = member.name
                                        
                                        if let indexU = members.firstIndex(where: {$0.name == "\(member.name)"}){
                                            members[indexU].total = myCart[index].price
                                            print(members[indexU].total)
                                        }
                                    }
                                }, label: {
                                    Text(member.name)
                                })
                            }
                        }))
                }
                .padding()
            }
        }
    }
}


struct Product: Identifiable {
    var id = UUID()
    var name : String
    var price : Double
    var assign : String     // for people assign
}

let shoppingCart = [
    Product(name: "Beef", price: 10, assign : "Select"),
    Product(name: "Pork", price: 8, assign : "Select"),
    Product(name: "Milk", price: 6, assign : "Select")
]

struct User: Identifiable {
    var id = UUID()
    var name : String
    var total : Double
}

let memberList = [
    User(name: "A", total: 10),
    User(name: "B", total: 20),
    User(name: "C", total: 30),
    User(name: "D", total: 40)
]



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
