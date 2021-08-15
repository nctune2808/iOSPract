//
//  ContentView.swift
//  CovidVisualisation
//
//  Created by Tuan on 21/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Home()
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
