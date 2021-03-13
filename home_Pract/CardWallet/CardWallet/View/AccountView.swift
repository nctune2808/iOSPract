//
//  AccountView.swift
//  CardWallet
//
//  Created by Tuan on 12/03/2021.
//

import SwiftUI

struct AccountView: View {
    
    @Binding var offset: CGFloat
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.primary)
                    
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "message")
                        .font(.title)
                        .foregroundColor(.primary)
                })
            }
            .padding(.horizontal)
            .overlay(
                Text("USER")
                    .font(.title2)
                    .fontWeight(.bold)
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        
                        Button(action: {}, label: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                        })
                        .overlay(
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                                .background(Color.white.clipShape(Circle()))
                                .offset(x: 8, y: 5)
                            , alignment: .bottomTrailing
                        )
                    }
                    .padding()
                }
                Divider()
                    .padding(.horizontal)
                
                VStack{
                    
                }
            }
        }
        .padding(.top, edges?.top ?? 15)
    }
}

