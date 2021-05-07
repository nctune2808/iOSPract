//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.


import SwiftUI


//var rect = UIScreen.main.bounds
//var edges = UIApplication.shared.windows.first?.safeAreaInsets



struct ContentView: View {
    
    @State var hide = false
    @State var selection = "Member"
    
    var body: some View {
        
        NavigationView {    // thêm navigation View
            TabView (selection: $selection) {
                MemberView()
                    .tabItem{ Image(systemName: "viewfinder.circle.fill")}
                    .tag("Member")

                WalletView(hide: $hide)
                    .tabItem{ Image(systemName: "creditcard.circle.fill") }
                    .tag("Wallet")

                AccountView()
                    .tabItem{ Image(systemName: "person.crop.circle.fill") }
                    .tag("Profile")
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("\(selection)")
            .accentColor(.blue)
            .navigationBarHidden( selection == "Wallet" ? true : false)
            
        }
    }
}

