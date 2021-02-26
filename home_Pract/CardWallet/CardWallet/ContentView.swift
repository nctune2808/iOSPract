//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            TopView()
            BodyView()
            BottomView()
        }
    }
}

struct TopView : View {
    
    @State private var cardFinder: String = ""
    
    var body: some View {
        
        HStack {
        
            HStack (alignment: .center, spacing: 10) {
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                TextField ("Find card", text: $cardFinder)
                    .disableAutocorrection(true)
                    
            }.padding(.horizontal,10)
            
            Button(action: {
                
            }, label: {
                Text("scan")
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .frame(width: 30, height: 25)
            }).padding(.horizontal,10)
        }
    }
}

struct BodyView : View {
    
    @State var size : CGSize = .zero
    @EnvironmentObject var cards: Cards
    
    var body: some View {
        
        
        GeometryReader { geo in
            
            ZStack {
                
                Color(.white).edgesIgnoringSafeArea(.all)
                
                Loader()
                
                ForEach(self.cards.brands) { card in
                    
                    VStack {
                        Image(card.image)
                            .resizable()
                            .frame(width: geo.size.width - 40, height: 250)
                    }
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .offset(y:card.position)
                    .offset(x: card.swipe)
                    .rotationEffect(.init(degrees: card.degree))
                    .animation(.spring())
                    .gesture(DragGesture()
                        .onChanged({ (value) in
                            if value.translation.width > 0 {
                                cards.update(card: card, value: value.translation.width, degree: 10)
                            } else {
                                cards.update(card: card, value: value.translation.width, degree: -10)
                            }
                            
                        })
                        .onEnded({ (value) in
                            if card.swipe > 0 {
                                if card.swipe > geo.size.width/2 - 100 {
                                    cards.update(card: card, value: 500, degree: 0)
                                } else {
                                    cards.update(card: card, value: 0, degree: 0)
                                }
                            }
                            else {
                                if -card.swipe > geo.size.width/2 - 100 {
                                    cards.update(card: card, value: -500, degree: 0)
                                } else {
                                    cards.update(card: card, value: 0, degree: 0)
                                }
                            }
                        })
                    )
                    
                    
                }                
            }
        }
    }
}

struct BottomView : View {
    
    @EnvironmentObject var cards : Cards
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                if cards.last != -1{
                    cards.goBack(index: cards.last)
                }
            }, label: {
                Image(systemName: "gobackward")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
            }).padding(.horizontal,10)
            
        }
    }
}

struct Loader : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Loader>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Loader>) {

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
