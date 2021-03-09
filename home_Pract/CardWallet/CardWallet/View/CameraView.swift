//
//  CameraView.swift
//  CardWallet
//
//  Created by Tuan on 09/03/2021.
//

import SwiftUI


struct CameraView : View {
    
    var body: some View {
        
        VStack {
            Text("Camera")
                .padding()
                .cornerRadius(20)
        }
        
        .contextMenu{
            VStack {
                Button(action: {
                    print("Wallet")
                }, label: {
                    HStack{
                        Text("Wallet")
                        Image(systemName: "creditcard.circle.fill")
                    }
                })
                
                Button(action: {
                    print("Camera")
                }, label: {
                    HStack{
                        Text("Camera")
                        Image(systemName: "camera.circle.fill")
                    }
                })
                
            }
        }
        
//        .navigationBarItems(trailing: Menu(content: {
//            Button(action: {
//                withAnimation {
//                    Text("ddd")
//                }
//            }, label: {
//                HStack{
//                    Text("Home")
//                    Image(systemName: "house.fill")
//                }
//            })
//        }, label: {
//            Image(systemName: "line.horizontal.3")
//        }))
        
    }
}
