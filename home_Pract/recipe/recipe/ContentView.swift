//
//  ContentView.swift
//  test
//
//  Created by Tuan on 08/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var title = ""
    @State var rating = 1.0
    @State var isCooked = false
    
    var body: some View {
        List {
            Section {
                LabelView(label: "Recipt Title")
                TextField(
                    "Enter Recipe",
                    text: $title
                )
            }
            
            Section {
                LabelView(label: "Rating")
                HStack {
                    Spacer()
                    Text(String(
                        repeating: "*",
                        count: Int(rating)
                    ))
                    Spacer()
                }
                Slider(
                    value: $rating,
                    in: 1...5,
                    step: 1
                )
            }
            
            Section {
                LabelView(label: "Have you cooked it before?")
                Toggle(isOn: $isCooked) {
                    Text("Cooked \(title.isEmpty ? "it" : title) before")
                };
    
            }
            
            Section {
                Button(action: {}){
                    HStack() {
                        Spacer()
                        LabelView(label: "SAVE")
                        Spacer()
                    }
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

struct LabelView: View {
    var label: String
    var body: some View {
        Text(label)
            .font(.subheadline)
            .foregroundColor(.blue)
    }
}
