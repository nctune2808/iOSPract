//
//  ContentView.swift
//  ContextMenu
//
//  Created by Tuan on 12/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bgColour = Color.blue
    
    var body: some View {
        
        VStack{
            Text("ABC")
                .padding()
                .background(bgColour)
            Text("Change")
                .padding()
                .contextMenu{
                    Button(action: {self.bgColour = .red}) {
                        Text("Red")
                        Image(systemName: "Checkmark.circle.fill").foregroundColor(.red)
                    }
                    Button(action: {self.bgColour = .yellow}) {
                        Text("Yellow")
                    }
                    Button(action: {self.bgColour = .green}) {
                        Text("Green")
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
