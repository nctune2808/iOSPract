//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        BodyView()
        
//        VStack{
//            TopView()
//            BodyView()
//        }
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
                    
            }
            
            Button(action: {
                
            }, label: {
                Text("scan")
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .frame(width: 30, height: 25)
            })
        }.padding()
    }
}



struct BodyView : View {
    
//    @EnvironmentObject var cards: Cards
    @State var scrolled = 1
    @State var hero = false
    
    @State var data = [
        Card(id: 1, name: "Morrisons", image: "Morrisons-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 2, name: "Boots", image: "Boots-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 3, name: "Tesco", image: "Tesco-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 4, name: "Iceland", image: "Iceland-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 5, name: "M&S", image: "M&S-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 6, name: "Nectar", image: "Nectar-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 7, name: "Holland&Barrett", image: "Holland&Barrett-front", offx: 0, offy: 0, degree: 0, expand: false),
        Card(id: 8, name: "Superdrug", image: "Superdrug-front", offx: 0, offy: 0, degree: 0, expand: false),
    ]
    
    
    
    var body: some View {
        
        VStack {
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack{
                    
                    VStack(spacing: 0) {
                        TopView()
                        
                        ForEach(0..<data.count) { card in
                            
                            GeometryReader{ geo in
                                
                                CardView(data: $data[card], hero: $hero, dimens: geo)
                                    
                                    .offset(y: data[card].expand ? -geo.frame(in: .global).minY : 0)
                                    .opacity(hero ? (data[card].expand ? 1 : 0) : 1)
                                    
                                    .onTapGesture {
                                        
                                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                            print(UIScreen.main.bounds.height)
                                            if !data[card].expand {
                                                hero.toggle()
                                                data[card].expand.toggle()
                                            }
                                        }
                                    }
                            }
                            .frame(height: UIScreen.main.bounds.height / (
                                    data[card].expand ? 1 : (UIScreen.main.bounds.height < 750 ? 2.8 : 3.5) )
                            )
                            .simultaneousGesture(DragGesture(minimumDistance: data[card].expand ? 0 : 500).onChanged({ (_) in
                                print("dragging")
                                
                            }))
                        }
                    }
                }
            }
        }
    }
}

struct CardView : View {    // clickable
    
    @Binding var data   : Card
    @Binding var hero   : Bool
    @State   var dimens : GeometryProxy
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            VStack {
                
                Image(data.image)               // front card
                    .resizable()
                    .frame( height: dimens.size.height / (
                                data.expand ? (UIScreen.main.bounds.height < 750 ? 2.8  : 3.5) :  1.1)
                    )
                    .cornerRadius(data.expand ? 30 : 30)
                    .shadow(radius: 10)
                
                if data.expand {                // back card
                    Image(data.image)
                        .resizable()
                        .frame(height: dimens.size.height / 3)
                        .cornerRadius(25)
                        .shadow(radius: 10)
                }
            }
            .padding(.horizontal, data.expand ? 0 : 15 )
            .padding(.vertical, dimens.size.height / 25)
            .contentShape(Rectangle())
            
            if data.expand {
                
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        data.expand.toggle()
                        hero.toggle()
                    }
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
            }
        }
        
    }
}


struct Card : Identifiable {
    var id: Int
    var name : String
    var image : String
    var offx: CGFloat
    var offy: CGFloat
    var degree : Double
    var expand : Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
