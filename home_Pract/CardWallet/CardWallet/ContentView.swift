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
                TextField ("Find card", text: $cardFinder)
                    .disableAutocorrection(true)
                    
            }.padding(.horizontal,10)
            
            Button(action: {
                
            }, label: {
                Text("scan")
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .frame(width: 35, height: 30)
            }).padding(.horizontal,10)
        }.foregroundColor(.gray)
    }
}

//struct CardDetailsView : View {
//    var name = ""
//    var image = ""
//    var width : CGFloat = 0
//    var body : some View {
//
//        ZStack{
//            Image(image)
//                .resizable()
//
//            VStack(alignment: .leading){
//
//                Text(name).fontWeight(.heavy).font(.system(size: 25))
//
//            }.padding([.bottom, .leading], 35)
//        }.frame(width: width)
//    }
//}


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
                    }))
                    .offset(x: card.swipe)
                    .rotationEffect(.init(degrees: card.degree))
                    .animation(.spring())
                    
                }
                
                
//                VStack {
//                    Color.orange
//                }
//                .frame(width: geo.size.width - 160, height: 250)
//                .cornerRadius(20)
//                .shadow(radius: 20)
//                .offset(y: -30)
//
//                VStack {
//                    Image("Tesco-clubCard")
//                        .resizable()
//                        .frame(width: geo.size.width - backViewSize, height: 250)
//                }
//                .cornerRadius(20)
//                .shadow(radius: 20)
//                .offset(y: -15)
//
//                VStack {
//                    Image("Boots-advantageCard")
//                        .resizable()
//                        .frame(width: geo.size.width - 50, height: 250)
//
//                }
//                .cornerRadius(20)
//                .shadow(radius: 20)
//                .gesture(DragGesture()
//                            .onChanged({ (value) in
//                                size = value.translation
//                                backViewSize = 50
//                            })
//                            .onEnded({ (value) in
//                                size = .zero
//                                backViewSize = 80
//
//                            }))
//                .offset(size)
                
            }
//            .animation(.spring())
        }
    }
}

struct BottomView : View {
    var body: some View {
        
        HStack {
            
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
