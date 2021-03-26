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
    @State var memberList : [[Member]] = [
        [Member(name: "M")]
    ]
    
    var body: some View {
        
        VStack(spacing: 50){
//            Text(member.name)
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(alignment: .center, spacing: 10){
                    ForEach(memberList.indices, id: \.self){ index in
                        HStack{
                            ForEach(memberList[index].indices, id: \.self) { i in
                            Text(memberList[index][i].name)
                                .padding(.horizontal)
                                .padding(.vertical,5)
                                .background(Capsule().stroke(Color.black, lineWidth: 1.5))
                                .lineLimit(1)
                                .overlay(
                                    GeometryReader{ reader -> Color in
                                        let maxX = reader.frame(in: .global).maxX
                                        
                                        if maxX > UIScreen.main.bounds.width - 50 && !memberList[index][i].isExceeded {
                                            
                                            DispatchQueue.main.async {
                                                
                                                memberList[index][i].isExceeded = true
                                                let lastItem = memberList[index][i]
                                                memberList.append([lastItem])
                                                memberList[index].remove(at: i)
                                            }
                                        }
                                        return Color.clear
                                    },
                                    alignment: .trailing
                                )
                                .clipShape(Capsule())
                                .onTapGesture {
                                    memberList[index].remove(at: i)
                                    
                                    if memberList[index].isEmpty{
                                        memberList.remove(at: index)
                                    }
                                    
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }
                        }
                        }
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
                    memberList.append([])
                }
                
                withAnimation(.default){
                    memberList[memberList.count - 1].append(Member(name: create))
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

