//
//  ContentView.swift
//  TabView
//
//  Created by Tuan on 12/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    var prospects = Prospects()
    var body: some View {
        
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
                }.tag(2)
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
                }.tag(3)
        }.environmentObject(prospects)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
