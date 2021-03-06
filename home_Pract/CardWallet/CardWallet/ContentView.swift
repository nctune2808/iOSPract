//
//  ContentView.swift
//  CardWallet
//
//  Created by Tuan on 26/02/2021.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var search : String = ""
    @State var hide = false
    @State var data : Cards


    var body: some View {
        
        VStack(spacing: 0) {
            
            if !hide { TopView(data: $data, search: $search) }   // header
            
            BodyView(data: $data, hide: $hide, search: $search)  // body
            
//            if !hide { BottomView() }         // footer
        }
        
    }
}

struct TopView : View {
    
    @Binding var data : Cards
    @Binding var search : String
    
    var body: some View {
        
        HStack {
        
            SearchBar(text: $search)

            Button(action: {
                
            }, label: {
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .frame(width: 30, height: 25)
                    .padding(.trailing,10)
            })
        }
        .frame(width: UIScreen.main.bounds.width / 1.05, height: 40)
        .padding(.all, 5)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 100)
    }
}


struct BodyView : View {
    
    @State var scrolled = 1
    @Binding var data : Cards
    @Binding var hide : Bool
    @Binding var search : String
    
    
//    func getSearchByName() -> Card {
//        guard !search.isEmpty else { return data.brands[Int] }
//        return data.brands.filter{ $0.name.containsCaseInsensitive(search) }
//    }
    var body: some View {
 
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 0) {

                ForEach(data.brands.filter ({
                    search.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(search)
                }), id: \.self) { card in
                    
                    GeometryReader{ geo in
                            
                        CardView(data: $data.brands[card.id-1], hide: $hide, dimens: geo)
                            
                            .offset(y: card.expand ? -geo.frame(in: .global).minY : 0)
                            .opacity(hide ? (card.expand ? 1 : 0) : 1)
                            .onTapGesture {
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    print(data.brands[card.id-1])
                                    if !card.expand {
                                        hide.toggle()
                                        data.brands[card.id-1].expand.toggle()
                                    }
                                }
                            }
                    }
                    .frame(height: UIScreen.main.bounds.height / (
                            card.expand ? 1 : (UIScreen.main.bounds.height < 750 ? 2.8 : 3.5) )
                    )
                    .simultaneousGesture(DragGesture(minimumDistance: card.expand ? 0 : 500).onChanged({ (_) in
                        print("dragging")
                        
                    }))
                }
            }
        }
    }
}

struct CardView : View {    // clickable
    
    @Binding var data : Card
    @Binding var hide   : Bool
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
                        hide.toggle()
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


//struct Card : Identifiable {
//    var id: Int
//    var name : String
//    var image : String
//    var expand : Bool
//}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let cards = Cards()
        ContentView(data: cards)
    }
}
