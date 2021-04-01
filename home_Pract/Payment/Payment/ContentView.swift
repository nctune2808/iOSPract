//
//  ContentView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView{
            MemberView()
                .navigationBarTitle("Create Member")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
