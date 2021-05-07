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
    @State var selection = "Profile"
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView {    // thêm navigation View
            TabView (selection: $selection) {
                MemberView()
                    .tabItem{ Image(systemName: "viewfinder.circle.fill")}
                    .tag("Member")
                    .background(Color.init("themeLightBlue").ignoresSafeArea())
                
                WalletView(hide: $hide)
                    .tabItem{ Image(systemName: "creditcard.circle.fill") }
                    .tag("Wallet")

                ProfileView()
                    .tabItem{ Image(systemName: "person.crop.circle.fill") }
                    .tag("Profile")
//                    .background(Color.init("themeLightBlue").ignoresSafeArea())
                    
                    
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("\(selection)")
            .accentColor(.blue)
            .navigationBarHidden( selection == "Wallet" ? true : false)
            
            
        }
        
    }
}

