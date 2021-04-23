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
    
    @State var hide = false

    @State var selectedTab = "creditcard.circle.fill"

    
    var body: some View {
        
        NavigationView {    // thêm navigation View
            TabView() {
                MemberView()
                    .tabItem{ Image(systemName: "viewfinder.circle.fill")}
                    .tag(0)

                WalletView(hide: $hide)
                    .tabItem{ Image(systemName: "creditcard.circle.fill") }
                    .tag(1)

                AccountView()
                    .tabItem{ Image(systemName: "person.crop.circle.fill") }
                    .tag(2)
            }
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.blue)
        }

        
    }

        
}

