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
    @State var selectedTab = "creditcard.circle.fill"

    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center,vertical: .bottom)) {
            
                TabView(selection: $selectedTab) {
                    WalletView(data: $data, hide: $hide, search: $search)  // body
                        .tag("creditcard.circle.fill")
                        
                    CameraView()
                        .tag("camera.circle.fill")
                }
                
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                
                if !hide { NavigationBar(selectedTab: $selectedTab) }      // footer
        
        }
    }
}

var tabs = ["creditcard.circle.fill","camera.circle.fill"]

struct TabButton: View {
    
    var icon : String
    @Binding var selectedTab: String
    
    var body: some View {
        
        Button(action: {selectedTab = icon}) {
            Image(systemName: icon)
                .renderingMode(.template)
                .foregroundColor(selectedTab == icon ? Color.blue : Color.black.opacity(0.4))
                .padding()
        }
    }
}

struct NavigationBar: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
            
        HStack{
            ForEach(tabs, id: \.self){ icon in
                
                TabButton(icon: icon, selectedTab: $selectedTab)
                
                if icon != tabs.last {
//                    Spacer()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.1, height: 45)
        .padding(.horizontal, 10)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(radius: 50)
            
    }
    
}

struct CameraView : View {
    
    var body: some View {
        
        VStack {
            Text("Camera")
        }
        
    }
}

struct WalletView : View {
    
    @Binding var data : Cards
    @Binding var hide : Bool
    @Binding var search : String
    
    var body: some View {
 
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            
            BodyWalletView (data: $data, hide: $hide, search: $search)
            
            if !hide { TopWalletView(data: $data, search: $search) }   // header
        }
        
    }
}

struct TopWalletView : View {
    
    @Binding var data : Cards
    @Binding var search : String
    
    var body: some View {
        
        HStack (spacing: 0) {
        
            SearchBar(text: $search)

            Button(action: {

            }, label: {
                Image(systemName: "barcode.viewfinder")
                    .resizable()
                    .frame(width: 30, height: 25)
            })
        }
        .padding(.horizontal, 15)
        .background(Color.white)
        
    }
}

struct BodyWalletView : View{
    
    @State var scrolled = 1
    @Binding var data : Cards
    @Binding var hide : Bool
    @Binding var search : String
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 0) {

                ForEach(data.brands.filter ({
                    search.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(search)
                }), id: \.self) { card in
                    
                    GeometryReader{ geo in
                            
                        DetailCardView(data: $data.brands[card.id-1], hide: $hide, dimens: geo)
                            
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
            .padding(.top, edge!.top + 10)
        }
        .background(Color.black.opacity(0.1).ignoresSafeArea(.all, edges: .all))
        
    }
    
}

struct DetailCardView : View {    // clickable
    
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

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let cards = Cards()
        ContentView(data: cards)
    }
}
