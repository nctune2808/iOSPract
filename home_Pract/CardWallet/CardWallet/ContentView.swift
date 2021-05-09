//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.


import SwiftUI


//var rect = UIScreen.main.bounds
//var edges = UIApplication.shared.windows.first?.safeAreaInsets

let themeHeavy = Gradient(colors: [Color.init("themeBlue"), Color.init("themePurple")])
let themeLight = Gradient(colors: [Color.init("themeLightPurple"), Color.init("themeLightBlue")])

struct ContentView: View {
    
    @State var hide = false
    @State var selection = "Profile"
    
    var body: some View {
        
        NavigationView {    // thêm navigation View
            TabView (selection: $selection) {
                MemberView()
                    .tabItem{ Image(systemName: "viewfinder.circle.fill") }
                    .tag("Member")
                    
                WalletView(hide: $hide)
                    .tabItem{ Image(systemName: "creditcard.circle.fill") }
                    .tag("Wallet")

                ProfileView()
                    .tabItem{ Image(systemName: "person.crop.circle.fill") }
                    .tag("Profile")
                    
                
                    
            }
            .navigationBarTitle("\(selection)", displayMode: .inline)
            .accentColor(.blue)
            .navigationBarHidden( selection == "Wallet" ? true : false)
        }
        
    }
}

