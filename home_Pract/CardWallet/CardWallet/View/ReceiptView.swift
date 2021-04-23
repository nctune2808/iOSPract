//
//  OrderView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct ReceiptView: View {
    
    @State var memberData : [Member]
    @State var productData : [Product]
    @State var isAssigned : Bool = false

    var body: some View {
        VStack {

            TopReceipt(
                memberData: memberData,
                productData: productData,
                isAssigned: $isAssigned
            )

            Spacer()

            BottomReceipt(
                memberData: memberData,
                productData: productData,
                isAssigned: $isAssigned
            )
        }
        .padding(.horizontal,10)
        .navigationBarTitle("Receipt", displayMode: .inline)
    }

}

struct TopReceipt: View {

    @State var memberData: [Member]
    @State var productData: [Product]
    @Binding var isAssigned : Bool

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

                    DetailsBox(
                        memberData: memberData,
                        productData: product,
                        isAssigned: $isAssigned
                    )
                }
                .padding(.all, 5)
                .background(Color.black.opacity(0.1).cornerRadius(10))
            }
        }
    }

    func formatPrice(value: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "GBP"
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}

struct BottomReceipt: View{

    @State var memberData: [Member]
    @State var productData: [Product]
    @Binding var isAssigned : Bool
    var body: some View{

        NavigationLink(destination: SplitView(memberData: $memberData), label: {
            Text("Let's Share")
                .frame(maxWidth: .infinity)
        })
        .padding()
        .background(Color.blue.cornerRadius(15))
        .foregroundColor(Color.white)
        .disabled(!isAssigned).opacity(isAssigned ? 1 : 0.5)
    }
}

struct DetailsBox: View {

    @State var memberData : [Member]
    @State var productData : Product
    @State var selections : [String] = []
    @Binding var isAssigned : Bool

    var body: some View{

        HStack{
            AssignedBox(
                selections: $selections
            )
            Spacer()
            DropdownBox(
                memberData: memberData,
                productData: productData,
                selections: $selections,
                isAssigned: $isAssigned
            )
        }
        .padding(.all, 5)
    }
}


struct AssignedBox: View {

    @Binding var selections : [String]

    var body: some View{

        ScrollView(.horizontal, showsIndicators: false) {
            Text(!selections.isEmpty ? selections.description : "")
                .padding(.horizontal, 5)
        }
    }
}

struct DropdownBox: View {
    @State var memberData : [Member]
    @State var productData : Product
    @Binding var selections : [String]
    @Binding var isAssigned : Bool

    var body: some View{
        Menu(){
            ForEach(memberData) { members in
                MultiSelect(title: members.name, isSelected: selections.contains(members.name)) {

                    if selections.contains(members.name) {   // has mem in selected array
                        selections.removeAll(where: { $0 == members.name })

                        members.cart.removeAll(where: { $0.productCart.name == productData.name } )

//                        if selections.isEmpty{              // empty selected array
//                            isChosen = false
//                        }
                    }
                    else {                                  // selected array added mem
                        selections.append(members.name)
//                        isChosen = (true)

                        members.cart.append(
                            Cart(productCart: productData, isChosen: true)
                        )

                    }
                    productData.repeated = selections.count
                    onCalculate()
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

    func indexMember(members : Member) -> Int {
        return memberData.firstIndex{ (mem) -> Bool in
            return members.id == mem.id
        } ?? 0
    }

    func onCalculate() {
        print("-------------------")
        isAssigned = false                  // init global isAssigned inactive in loop
        for members in memberData {
            var cartTotal : Double = 0.0

            print("{ \(members.name) }")
            for carts in members.cart{

                print(" | \(carts.productCart.price) -> [ \(carts.productCart.repeated) ] -> { \(carts.isChosen) }")

                cartTotal += carts.productCart.price / Double(carts.productCart.repeated)

                isAssigned = carts.isChosen     // set global isAssigned available if exist cart

            }
            members.total = cartTotal
            print("=> \(members.total)")
            print("-------------------")
        }
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



