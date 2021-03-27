//
//  ProductView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

//struct ProductView: View {
//
//    @Binding var product: Product
//    @StateObject var membertList = MemberViewModel()
//    var orderList = [Order]()
//
//
//    var body: some View {
//
//
//        Section(header: HStack{
//            Text(product.name)
//            Spacer()
//            Text(getPrice(value: product.price))
//        }) {
////            ForEach(membertList.mems) { member in
////                MemberView(member: $membertList.mems[getIndex(mem: member)])
////            }
//        }
//        .padding()
//    }
//
//    func getPrice(value: Float) -> String {
//        let format = NumberFormatter()
//        format.numberStyle = .currency
//
//        return format.string(from: NSNumber(value: value)) ?? ""
//    }
//
//    func getIndex(mem : Member) -> Int {
//        return membertList.mems.firstIndex{ (mem1) -> Bool in
//            return mem.id == mem1.id
//        } ?? 0
//    }
//
//    //    func getTotal() -> String {
//    //        var price : Float = 0
//    //
//    //        productList
//    //    }
//}



