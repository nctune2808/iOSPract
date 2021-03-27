//
//  MemberView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct MemberView: View {
    
    @State var create = ""
    @State var memberList : [Member] = []
    @State var productList : [Product] = []
    var selections : [String] = []
    var cartList : [Cart] = []
    
    var body: some View {
        
        VStack(spacing: 10){
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .center, spacing: 10){
                    ForEach(memberList.indices, id: \.self){ index in
                        HStack(spacing: 0){
                            Text(memberList[index].name)
                                .padding(.horizontal, 5)
                            Button(action: {
                                if !memberList.isEmpty{
                                    memberList.remove(at: index)
                                }
//                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.all, 5)
                            })
                        }
                        .background(Capsule().stroke(Color.black, lineWidth: 1))
                    }
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 2)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5),lineWidth: 1.5))



            TextField("Create new member", text: $create, onCommit: onCommit)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5),lineWidth: 1.5))

            Button(action: { onCommit() }, label: {
                Text("Add member")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
            .disabled(create == "")
            .opacity(create == "" ? 0.5 : 1)
            
            NavigationLink(destination: OrderView(memberList: $memberList, selections: selections, cartList: cartList), label: {
                Text("Let's share")
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.8))
            .foregroundColor(Color.white)
            .cornerRadius(10)
        
//            Button(action: {
//                print(memberList)
//            }, label: {
//                Text("Done, Next")
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .foregroundColor(Color.white)
//                    .cornerRadius(10)
//
//            })
            
            
        }
        .padding()
        
        
    }
    
    func onCommit() {
        if memberList.isEmpty{
            memberList.append(contentsOf: [])
        }
        withAnimation(.default){
            memberList.append(Member(name: create))
            create = ""
        }
    }
}

