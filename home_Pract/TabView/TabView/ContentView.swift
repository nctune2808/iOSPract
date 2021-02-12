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
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }.tag(1)
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "bell")
                    Text("Two")
                }.tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
