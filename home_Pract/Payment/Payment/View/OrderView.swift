//
//  OrderView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var memberList = MemberViewModel()
    @ObservedObject var productList = ProductViewModel()
    
    var body: some View {
        VStack {
            
            TopReceipt(
                memberData: memberList.memberData,
                productData: productList.productData
            )
            
            Spacer()
            
            BottomReceipt(
                memberData: memberList.memberData,
                productData: productList.productData
            )
        }
        .padding(.horizontal,10)
        .navigationTitle("Recipe")
    }
    
}

struct TopReceipt: View {
    
    @State var memberData: [Member]
    @State var productData: [Product]
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            
            ForEach(productData){ product in
                
                VStack(spacing:0){
                    
                    HStack{
                        Text(product.name)
                        Spacer()
                        Text(formatPrice(value: product.price))
                            .frame(maxWidth: 80)
                            .padding(.all, 3)
                            .background(Color.white.cornerRadius(5))
                            .foregroundColor(.black)
                    }
                    .padding(.all, 5)
                    
                    Divider().padding(.vertical, 3)
                    
                    BottomBox(
                        memberData: memberData,
                        productData: product
                    )
                }
                .padding(.all, 5)
                .background(Color.black.opacity(0.1).cornerRadius(10))
            }
        }
    }
    
    func formatPrice(value: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "GBP"
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}

struct ReceiptTotal: View {
    
    @Binding var memberData : [Member]
    
    var body: some View {
        ForEach(memberData) { members in
            
            Text("\(members.name) : \(members.total)")
                .font(.title)
                        
        }
    }
    
}

struct CalculateReceipt: View {
    
    @Binding var memberData: [Member]
    @Binding var productData: [Product]
    
    var body: some View{
        
        Button(action: {
            
            print("-------------------")
                         
            for members in memberData {
                var cartTotal : Float = 0.0
                print("--> \(members.name)")
                for carts in members.cart{
                    print("| \(carts.productCart.price) -> [ \(carts.productCart.repeated) ]")
                    cartTotal += carts.productCart.price / Float(carts.productCart.repeated)
                    
                }
                print("=> \(cartTotal)")
                
                members.total = cartTotal
                
                print("member total \(members.total)")
                print("-------------------")
                
//                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }, label: {
            Text("Calculate")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.cornerRadius(10))
                .foregroundColor(Color.white)
        })
    }
       
}

struct BottomReceipt: View{
    
    @State var memberData: [Member]
    @State var productData: [Product]
    
    var body: some View{
        
        VStack {
            
            ReceiptTotal(memberData: $memberData)
            CalculateReceipt(memberData: $memberData, productData: $productData)
        }
        
    }
}

struct BottomBox: View {
    
    @State var memberData : [Member]
    @State var productData : Product
    @State var selections : [String] = []
    @State var isChosen : Bool = false
    
    var body: some View{
        
        HStack{
            
            AssignedBox(
                selections: $selections,
                isChosen: $isChosen
            )

            Spacer()
            
            DropdownBox(
                memberData: memberData,
                productData: productData,
                selections: $selections,
                isChosen: $isChosen
            )
            
        }
        .padding(.all, 5)
        
    }
    
}


struct AssignedBox: View {
    
    @Binding var selections : [String]
    @Binding var isChosen: Bool
    
    var body: some View{
    
        ScrollView(.horizontal, showsIndicators: false) {
            Text(isChosen ? selections.description : "")
                .padding(.horizontal, 5)
        }
    }
}

struct DropdownBox: View {
    @State var memberData : [Member]
    @State var productData : Product
    @Binding var selections : [String]
    @Binding var isChosen : Bool
    
    
    var body: some View{
        Menu(){
            
            ForEach(memberData) { members in
                
                MultiSelect(title: members.name, isSelected: selections.contains(members.name)) {
                               
                    if selections.contains(members.name) {   // has mem in selected array
                        selections.removeAll(where: { $0 == members.name })
                        members.cart.remove(at: indexMember(member: members) )
                        
                        
                        
                        if selections.isEmpty{              // empty selected array
                            isChosen = false
                        }
                    }
                    else {                                  // selected array added mem
                        selections.append(members.name)
                        isChosen = true
                        productData.repeated = selections.count
                        members.cart.append(
                            Cart(productCart: productData)
                        )
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
    
    func indexMember(member : Member) -> Int {
        return memberData.firstIndex{ (mem1) -> Bool in
            return member.id == mem1.id
        } ?? 0
    }
    
    func getTotal(price: Float, amountShared: Int) -> Float {
        return price / Float(amountShared)
    }
}


struct MultiSelect: View {
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



