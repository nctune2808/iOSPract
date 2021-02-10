//
//  ContentView.swift
//  Navigation
//
//  Created by Tuan on 10/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Screen(
                title: "HOME",
                detail: "First Screen",
                icon: "house"
            )
        }
    }
}

struct Screen: View {
    
    let title: String
    let detail: String
    let icon: String
    
    var body: some View{
        
        VStack{
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
                .padding()
            
            Text(detail)
                .padding()
            
            NavigationLink(
                
                destination: Screen(
                    title: "Notification",
                    detail: "Second Screen",
                    icon: "bell"
                ),
                label: {
                    btnContinue(btnColor: .blue)
                }
            )
            
        }.navigationTitle(title)

    }
}

struct btnContinue: View {
    
    var btnColor: Color
    
    var body: some View {
        Text("Continue")
            .accentColor(.white)
            .frame(width: 100, height: 50)
            .background(btnColor)
            .cornerRadius(5)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
