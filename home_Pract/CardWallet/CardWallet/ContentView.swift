//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var search : String = ""
    @State var hide = false
    @State var data : Cards
    @State var selectedTab = "creditcard.circle.fill"

    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center,vertical: .bottom)) {
            
            TabView(selection: $selectedTab) {
                WalletView(data: $data, hide: $hide, search: $search)  // body
                    .tag("creditcard.circle.fill")
                CameraView()
                    .tag("camera.circle.fill")
            }
            .ignoresSafeArea(.all, edges: .all)
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
//            .onAppear(perform: {
//                UIScrollView.appearance().bounces = false
//             })
        
            if !hide { NavigationBar(selectedTab: $selectedTab) }      // footer
        
        }
    }
}

var tabs = ["creditcard.circle.fill","camera.circle.fill"]

struct TabButton: View {
    
    var icon : String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: {selectedTab = icon}) {
            Image(systemName: icon)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(selectedTab == icon ? Color.blue : Color.black.opacity(0.4))
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
        .frame(height: 45)
        .padding(.horizontal, 10)
        
            
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let cards = Cards()
        ContentView(data: cards)
    }
}
