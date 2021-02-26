//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var backViewSize : CGFloat = 80
    @State var size : CGSize = .zero
    var body: some View {
        
        GeometryReader { reader in
            
            ZStack {
                
                Color(.white).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Color.blue
                }
                .frame(width: reader.size.width - 160, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -30)
                
                VStack {
                    Color.orange
                }
                .frame(width: reader.size.width - backViewSize, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -15)
                
                VStack {
                    Color.red
                }
                .frame(width: reader.size.width - 50, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .gesture(DragGesture()
                            .onChanged({ (value) in
                                size = value.translation
                                backViewSize = 50
                            })
                            .onEnded({ (value) in
                                size = .zero
                                backViewSize = 80

                            }))
                .offset(size)
                
            }
            .animation(.spring())

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
