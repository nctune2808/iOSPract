//
//  AccountView.swift
//  CardWallet
//
//  Created by Tuan on 12/03/2021.
//

import SwiftUI

struct ProfileView : View {
    
    @State var imgData =  Data.init(capacity: 0)
    @State var shown = false
    

    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack (spacing: 10){
                HStack{
                    
                    NavigationLink(destination: SettingsView(), label: {
                        Image(systemName: "gearshape")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.all, 5)
                            .background(LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing).clipShape(Circle()))
                            
                    })

                    Spacer()
                    
                    
                    Button(action: {
                        self.shown.toggle()
                    }, label: {
                        if imgData.count != 0 {
                            Image(uiImage: UIImage(data: imgData)!)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 80, height: 80)
                                
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .accentColor(.gray.opacity(0.5))
                        }
                    }).sheet(isPresented: $shown) {
                        ImagePicker(shown: $shown, imgData: $imgData)
                    }
                    .padding(.all, 3)
                    .background(Circle().stroke(
                        LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing),lineWidth: 3)
                    )
                    
                    
                    

                    Spacer()
                    
                    NavigationLink(destination: MessagingView(), label: {
                        Image(systemName: "message")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.all, 5)
                            .background(LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing).clipShape(Circle()))
                    })
                }
                
                Text("name")
                
                Spacer()
                
                VStack{
                    Text("Note List")
                }
                .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 4)
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
                .background(RoundedRectangle(cornerRadius: 10).stroke(
                    LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing),lineWidth: 3
                ))
                
                Spacer()
                
                VStack{
                    Text("History Sharing")
                }
                .frame(width: UIScreen.main.bounds.width - 30 ,height: UIScreen.main.bounds.height / 3)
                .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 10)))
                .background(RoundedRectangle(cornerRadius: 10).stroke(
                    LinearGradient(gradient: themeHeavy, startPoint: .leading, endPoint: .trailing),lineWidth: 3
                ))
            }
            .padding()
            
        }
        .background(LinearGradient(gradient: themeLight, startPoint: .leading, endPoint: .trailing))
//        .background(Color.init("themeLightBlue").ignoresSafeArea())
        
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


    
