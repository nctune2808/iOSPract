//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//
import Foundation
import SwiftUI


var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets



struct ContentView: View {
    @State private var search : String = ""
    @State var hide = false
    @State var data : Cards
    @State var selectedTab = "creditcard.circle.fill"
    @State var offset: CGFloat = rect.width

    
    
    var body: some View {
        
        GeometryReader{ reader in
            let frame = reader.frame(in: .global)
            TabViewModel (tabs: ["","",""], rect: frame, offset: $offset) {
                
                CameraView(offset: $offset)
                
                WalletView(data: $data, hide: $hide, search: $search, offset: $offset)
                                
                AccountView(offset: $offset)
                    
            }
            .overlay(
                
                
                VStack(spacing: 50){
                    if !hide {
                        NavigationBar(offset: $offset, hide: $hide)
                            .padding(.bottom, edges?.bottom ?? 15)
                            .padding(.horizontal,8)
                    }
                }
                , alignment: .bottom
            )
            .ignoresSafeArea()
        }
        .ignoresSafeArea()

    }
}

let tabsMap : [String : CGFloat] = [
    "camera.circle.fill"     : 0,
    "creditcard.circle.fill" : rect.width,
    "person.crop.circle.fill": rect.width * 2
]

struct NavigationBar: View {
    @Environment(\.colorScheme) var scheme
    @Binding var offset: CGFloat
    @Binding var hide : Bool
    var body: some View {
            
        HStack(spacing:50){
            
            Spacer()
            ForEach(tabsMap.keys.sorted(), id:\.self) { icon in
                
                Button(action: {
                    offset = tabsMap[icon]!
                    
                }) {
                    Image(systemName: icon )
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor( offset == tabsMap[icon] ? .blue : .gray)
                        .background(scheme == .dark ? Color.black.opacity(0.8) : Color.white.opacity(0.8))
                        .cornerRadius(20)
                        .frame(width: 40, height: 40)
                }
            }
            Spacer()
        }
        .frame(height: 60)
        .background(scheme == .dark ? Color.black.opacity(0.8) : Color.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 50)
       
            
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let cards = Cards()
        ContentView(data: cards)
            .preferredColorScheme(.dark)

    }
}
