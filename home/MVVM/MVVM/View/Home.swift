//
//  Home.swift
//  MVVM
//
//  Created by Tuan on 21/02/2021.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var users = FetchAccounts()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:0){
                Text("Hello!!!")
            }
        }.onAppear {
            self.users.fetchUsers()
        }.navigationTitle("HOME")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
