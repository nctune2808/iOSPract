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
    @State var offset: CGFloat = 0

    var body: some View {
        
        GeometryReader{ reader in
            let frame = reader.frame(in: .global)
            TabViewModel (tabs: ["",""], rect: frame, offset: $offset) {

                
                WalletView(data: $data, hide: $hide, search: $search, offset: $offset)
                    
                AccountView(offset: $offset)
                    
            }
            .overlay(
                VStack(spacing: 50){
                    if !hide {
                        NavigationBar(selectedTab: $selectedTab)
                            .padding(.bottom, edges?.bottom ?? 15)
                            .padding(.horizontal,8)
                        
                    }
                }, alignment: .bottom
            )
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        
        
//        TabView(selection: $selectedTab) {
//            WalletView(data: $data, hide: $hide, search: $search, offset: $offset)  // body
//                .tag("creditcard.circle.fill")
////                CameraView()
////                    .tag("camera.circle.fill")
//            AccountView(offset: $offset)
//                .tag("person.crop.circle.fill")
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .ignoresSafeArea()
//        .overlay(
//            VStack(spacing: 50){
//
//                if !hide { NavigationBar(selectedTab: $selectedTab).padding(.bottom, edges?.bottom ?? 15) }
//            }, alignment: .bottom
//        )
//        .ignoresSafeArea()
    

    }
}

var tabs = ["creditcard.circle.fill","camera.circle.fill","person.crop.circle.fill"]

struct TabButton: View {
    
    var icon : String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: {selectedTab = icon}) {
            Image(systemName: icon)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(selectedTab == icon ? Color.blue : Color.gray)
                .frame(width: 40, height: 40)
        }
    }
}

struct NavigationBar: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
            
        HStack{
            Spacer()
            ForEach(tabs, id: \.self){ icon in
                
                TabButton(icon: icon, selectedTab: $selectedTab)
                Spacer()
//                if icon != tabs.last {
//                    Spacer()
//                }
                
            }
        }
        .frame(height: 60)
//        .padding(.horizontal, 10)
        .background(Color.white)
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
