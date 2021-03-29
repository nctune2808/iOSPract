//
//  OrderView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct OrderView: View {
    
    @State var memberList: [Member]
    
    var selections : [String] = []
    
    @State var cartList : [Cart] = []
    
    @State var productList = [
        Product(name: "Beef", price: 10),
        Product(name: "Turkey", price: 9),
        Product(name: "Chicken", price: 8),
        Product(name: "Lamb", price: 7),
        Product(name: "Pork", price: 6),
        Product(name: "Eggs", price: 5),
        Product(name: "Milk", price: 4),
        Product(name: "Eggs", price: 3),
        Product(name: "Snack", price: 2),
        Product(name: "Bread", price: 1)
    ]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false){
                ForEach(0..<productList.count){ i in
                    
                    VStack(spacing:0){
                        HStack{
                            Text(productList[i].name)
                            Spacer()
                            Text(formatPrice(value: productList[i].price))
                                .frame(maxWidth: 80)
                                .padding(.all, 3)
                                .background(Color.white.cornerRadius(5))
                                .foregroundColor(.black)
                        }
                        .padding(.all, 5)
                        
                        Divider().padding(.vertical, 3)
                        
                        DisplayView(
                            memberList: $memberList,
                            productList: $productList[i],
                            cartList: $cartList,
                            selections: selections
                        )
                    }
                    .padding(.all, 5)
                    .background(Color.black.opacity(0.1).cornerRadius(10))
                }
            }
            Spacer()
            
            Text("Total")
                .font(.title)
            
            Button(action: {
                print("--> Total: \($cartList)")
            }, label: {
                Text("Calculate")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(Color.white)
            })
            
        }.padding(.horizontal,10)
    }
    
    func formatPrice(value: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "GBP"
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}


struct DisplayView: View {
    
    @Binding var memberList: [Member]
    @Binding var productList : Product
    @Binding var cartList : [Cart]
    @State var selections : [String]
    
    
    var body: some View{
        
        HStack{
            
            ScrollView(.horizontal, showsIndicators: false) {
                Text(selections.description)
                    .padding(.horizontal, 5)
            }

            Spacer()
            
            Menu(){
                ForEach(memberList, id: \.self) { mem in
                    MultipleSelectionRow(title: mem.name, isSelected: selections.contains(mem.name)) {
                        if selections.contains(mem.name) {
                            selections.removeAll(where: { $0 == mem.name })
                           
    //                        cartList.remove(at: getIndexMember(mem: mem))
                            
    //                        memberList[getIndexMember(mem: mem)].total -= productList[i].price
                            print("\(cartList)")
                        }
                        else {
                            selections.append(mem.name)

    //                        memberList[getIndexMember(mem: mem)].total += productList[i].price
                            cartList.append(
                                Cart(memberName: mem,
                                     memberProduct: productList,
                                     currentTotal: getTotal(price: productList.price, amountShared: selections.count)
                                ))
                            print("\(cartList)")
                        }
                    }
                }
            } label: {
                if selections.isEmpty{
                    Text("Assign").frame(maxWidth: 80)
                } else {
                    Text("\(selections.count)").frame(maxWidth: 80)
                }
            }
            .padding(.all, 3)
            .background(Color.black.cornerRadius(5))
            .foregroundColor(.white)
        }
        .padding(.all, 5)
        
    }
    
//    func getIndexMember(mem : Member) -> Int {
//        print("mem: \(mem)")
//        return memberList.firstIndex{ (mem1) -> Bool in
//            return mem.id == mem1.id
//        } ?? 0
//    }
    
    func getTotal(price: Float, amountShared: Int) -> Float {
        return price / Float(amountShared)
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
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                } else {
                    Image(systemName: "circle")
                }
            }
        }.foregroundColor(Color.black)
    }
}



