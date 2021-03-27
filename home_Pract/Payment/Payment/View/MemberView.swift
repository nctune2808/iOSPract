//
//  MemberView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct MemberView: View {
//    @Binding var member: Member
    @State var create = ""
    @State var memberList : [Member] = []
    
    
    var body: some View {
        
        VStack(spacing: 50){
//            Text(member.name)
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .center, spacing: 10){
                    ForEach(memberList.indices, id: \.self){ index in
                            Button(action: {
                                if !memberList.isEmpty{
                                    memberList.remove(at: index)
                                }
//                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

                            }, label: {
                                Text(memberList[index].name)
                                    .padding(.horizontal)
                                    .padding(.vertical,5)
                                    .background(Capsule().stroke(Color.black, lineWidth: 1))
//                                    .lineLimit(1)
                                    .overlay(
                                        GeometryReader{ reader -> Color in
                                            let maxX = reader.frame(in: .global).maxX

                                            if maxX > UIScreen.main.bounds.width - 50 && !memberList[index].isExceeded {

                                                DispatchQueue.main.async {

                                                    memberList[index].isExceeded = true
                                                    let lastItem = memberList[index]
                                                    memberList.append(contentsOf: [lastItem])
                                                    memberList.remove(at: index)
                                                }
                                            }
                                            return Color.clear
                                        },
                                        alignment: .trailing
                                    )
                                    .clipShape(Capsule())
                            }
                            )
                    }
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 3)
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5),lineWidth: 1.5))



            TextEditor(text: $create)
                .padding()
                .frame(height: 150)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5),lineWidth: 1.5))

            Button(action: {

                if memberList.isEmpty{
                    memberList.append(contentsOf: [])
                }

                withAnimation(.default){
                    memberList.append(Member(name: create))
                    create = ""
                }


            }, label: {
                Text("Add Member")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
            .disabled(create == "")
            .opacity(create == "" ? 0.5 : 1)
        }
        .padding()
        
        
    }
}

