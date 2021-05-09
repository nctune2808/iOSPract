//
//  ContentView.swift
//  Football
//
//  Created by Tuan on 09/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List (playerList) { player in
                
                NavigationLink (destination: Image(player.image)){ 
                    PlayerRow (player: player)
                }
                
            }
            .navigationBarTitle("FC.Barcelone")
        }
    }
}
