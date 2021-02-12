//
//  ContentView.swift
//  TabView
//
//  Created by Tuan on 12/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
//        TabView(selection: $selectedTab) {
//            Text("Tab 1")
//                .tabItem {
//                    Image(systemName: "star")
//                    Text("One")
//                }.tag(1)
//            Text("Tab 2")
//                .tabItem {
//                    Image(systemName: "bell")
//                    Text("Two")
//                }.tag(0)
//        }
        
        TabView{
            ProspectsView(filter: .none)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Everyone")
                }.tag(0)
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Contacted")
                }.tag(1)
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("Uncontaced")
                }.tag(1)
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
