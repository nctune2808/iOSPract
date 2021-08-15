//
//  MemberView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct MemberView: View {
    
    
    @State var create = ""
    @ObservedObject var memberList = MemberViewModel()
    @State var cartList : [Cart] = []
    
    var body: some View {
        
//        VStack(spacing: 20, alignment: .leading){
        VStack(alignment: .leading, spacing: 20) {
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .center, spacing: 10){
                    ForEach(memberList.memberData){ member in
                        HStack(spacing: 0){
                            Text(member.name)
                                .padding(.horizontal, 5)
                            Button(action: {
                                if !memberList.memberData.isEmpty{
                                    memberList.memberData.remove(at: indexMember(mem: member))
                                }
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing).clipShape(Circle()))
                            })
                        }
                        .background(LinearGradient(gradient: themeLight, startPoint: .leading, endPoint: .trailing).clipShape(Capsule()))
                    }
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 2)
            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
            .background(RoundedRectangle(cornerRadius: 10).stroke(
                LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing),lineWidth: 3
            ))

            TextField("Create new member", text: $create, onCommit: onAdd)
                .padding()
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
                .background(RoundedRectangle(cornerRadius: 10).stroke(
                    LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing),lineWidth: 3
                ))
            
            Button(action: { onAdd() }, label: {
                Text("Add member")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(Color.white)
            })
            .disabled(create == "")
            .opacity(create == "" ? 0.5 : 1)
            
            
            NavigationLink(destination: ScanningView(memberList: memberList), label: {
                Text("Let's Start")
                    .frame(maxWidth: .infinity)
            })
            .padding()

        }
        .padding()
        .background(LinearGradient(gradient: themeLight, startPoint: .leading, endPoint: .trailing))
        
    }
    
    func onAdd() {
        if memberList.memberData.isEmpty{
            memberList.memberData.append(contentsOf: [])
        }
        withAnimation(.default){
            memberList.memberData.append(Member(name: create, total: 0.0, cart: cartList))
            create = ""
        }
    }
    
    func indexMember(mem : Member) -> Int {
        return memberList.memberData.firstIndex{ (mem1) -> Bool in
            return mem.id == mem1.id
        } ?? 0
    }

}

