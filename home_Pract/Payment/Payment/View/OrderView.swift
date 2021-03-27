//
//  OrderView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct OrderView: View {
    
    @Binding var memberList: [Member]
    
    @State var selections : [String]
    
    @State var cartList : [Cart]
    
    
    
    var productList = [
        Product(name: "Beef", price: 10),
        Product(name: "Pork", price: 8),
        Product(name: "Eggs", price: 6),
        Product(name: "Milk", price: 4)
    ]
    
    var body: some View {
        
        VStack {
            
            ForEach(0..<productList.count, id: \.self){ i in
                
                HStack{
                    
                    Text(productList[i].name)

                    Menu(selections.description) {
                        
                        ForEach(memberList, id: \.self) { mem in
                            
                            MultipleSelectionRow(title: mem.name, isSelected: selections.contains(mem.name)) {
                                if selections.contains(mem.name) {
                                    selections.removeAll(where: { $0 == mem.name })
//
                                    cartList.remove(at: getIndexMember(mem: mem))
                                    
                                    memberList[0].total -= productList[i].price
//                                    print("\(memberList[0])")
                                }
                                else {
                                    selections.append(mem.name)
                                    
                                    memberList[getIndexMember(mem: mem)].total += productList[i].price

                                    cartList.append(Cart(memberName: memberList[getIndexMember(mem: mem)].name, memberProduct: productList[i].name, total: productList[i].price))
                                    print("\(cartList)")
                                }
                            }
                        }
                    }
                }
            }
            
//            ForEach(cartList, id: \.self){ cart in
//                Button(action: {
//                    print(cartList)
//                }, label: {
//                    Text("Print")
//                })
//            }
            
        }
    }
    
    func getIndexMember(mem : Member) -> Int {
        return memberList.firstIndex{ (mem1) -> Bool in
            return mem.id == mem1.id
        } ?? 0
    }
}



struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                } else {
                    Image(systemName: "circle")
                }
            }
        }.foregroundColor(Color.black)
    }
}



