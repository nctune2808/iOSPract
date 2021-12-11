//
//  ContentView.swift
//  UWEDiceiOS
//
//  Created by Lloyd Savickas on 18/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var diceNum = ""
    
    
    var body: some View {
        
        VStack {
            Image("UWE_Logo")
                .resizable()
                .padding()
                .scaledToFit()
            
            Spacer()
            
            Image(diceNum)
            
            Spacer()

            Button(action: {
                
                diceNum = updateDiceImg()
            }, label: {
                Text("Roll")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            })
        }
    }
}

func updateDiceImg() -> String {
    let diceRoll = Int.random(in: 1...6)
    return "dice" + String(diceRoll)
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
