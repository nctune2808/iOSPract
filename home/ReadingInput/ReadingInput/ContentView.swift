//
//  ContentView.swift
//  ReadingInput
//
//  Created by Tuan on 12/02/2021.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "TUAN"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    let user = User()
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }.environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

