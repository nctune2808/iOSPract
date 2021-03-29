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
    
    var body: some View {
        
        VStack(spacing: 10){
            ScrollView(.vertical, showsIndicators: true){
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
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(Color.white)
            })
            .disabled(create == "")
            .opacity(create == "" ? 0.5 : 1)
            
            NavigationLink(destination: OrderView(memberList: memberList), label: {
                Text("Let's share")
                    .frame(maxWidth: .infinity)
            })
            .padding()
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

