//
//  AccountView.swift
//  CardWallet
//
//  Created by Tuan on 12/03/2021.
//

import SwiftUI

struct ProfileView : View {
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack (spacing: 0){
                HStack{
                    
                    NavigationLink(destination: SettingsView(), label: {
                        Image(systemName: "gearshape")
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    

                    Spacer()
                    
                    NavigationLink(destination: MessagingView(), label: {
                        Image(systemName: "message")
                            .font(.title)
                            .foregroundColor(.primary)
                    })
                }
                
                Text("name")
                
                Spacer()
                
                VStack{
                    Text("Note List")
                }
                .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 4)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5),lineWidth: 1.5))
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
                
                Spacer()
                
                VStack{
                    Text("History Sharing")
                }
                .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 3)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5),lineWidth: 1.5))
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
            }
            .padding()
            
        }
        .background(Color.init("themeLightBlue").ignoresSafeArea())
    }
}


struct AccountView: View {
    
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
    }
    
}


    
