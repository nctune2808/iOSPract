//
//  ContentView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var productList = ProductViewModel()
//    @StateObject var membertList = MemberViewModel()
    
    
    var body: some View {
        NavigationView{
            MemberView()
                .navigationBarTitle("Create Member")
        }
        
//        ScrollView(.vertical, showsIndicators: false){
//            LazyVStack(spacing: 0){
//                ForEach(productList.items) { product in
//                    ProductView(product: $productList.items[getIndexProduct(item: product)])
//                }
//                ForEach(membertList.mems) { member in
//                    MemberView(member: $membertList.mems[getIndexMember(mem: member)])
//                }
                
               
//            }
//        }
        
    
            
        
        
        
    }
    
//    func getIndexProduct(item : Product) -> Int {
//        return productList.items.firstIndex{ (item1) -> Bool in
//            return item.id == item1.id
//        } ?? 0
//    }
//    
//    func getIndexMember(mem : Member) -> Int {
//        return membertList.mems.firstIndex{ (mem1) -> Bool in
//            return mem.id == mem1.id
//        } ?? 0
//    }

}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
