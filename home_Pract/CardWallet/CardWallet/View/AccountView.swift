//
//  AccountView.swift
//  CardWallet
//
//  Created by Tuan on 12/03/2021.
//

import SwiftUI

struct AccountView: View {
    
    @Binding var offset: CGFloat
    
    @State private var recognizedText : [String] = ["Tap button to start scanning"]
    @State private var showingScanningView = false
    @State var productData : [Product] = []
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    ForEach(0..<recognizedText.count, id: \.self) {item in
                        HStack{
                            Text(recognizedText[item])
                            Spacer()
                            Button(action: {
                                recognizedText.remove(at: item)
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                            })
                        }
                        .padding()
                        .background(item % 2 == 0 ? Color.black.opacity(0.8) : Color.white)
                        .foregroundColor(item % 2 == 0 ? .white : .black)
                    }
                }
                       
                Spacer()

                HStack(spacing: 30) {
                   
                   Button(action: {
                       self.showingScanningView = true
                   }) {
                       Text("Scan")
                   }
                   .padding()
                   .foregroundColor(.white)
                   .background(Capsule().fill(Color.blue))
                    
                    Button(action: {
                        productData = []
                        
                        for i in 0..<(recognizedText.count / 2) {
                            productData.append(
                                Product(name: recognizedText[2*i],
                                        price: recognizedText[2*i+1],
                                        repeated: 0
                                )
                            )
                        }
                        
                        print("product: ", productData)
                        
                    }) {
                        Text("Save")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Capsule().fill(Color.red))
                    
                    NavigationLink(destination: ReceiptView(productData: $productData), label: {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                    })
                    .padding()
                    
                    
                    
                }
                .padding()
                }
                .sheet(isPresented: $showingScanningView) {
                ScanDocumentViewModel(recognizedText: self.$recognizedText)
            }
            .navigationBarTitle("Supermarket")
        }
        
    }
}


//    var body: some View {
//        VStack{
//            HStack{
//                Button(action: {
//
//                }, label: {
//                    Image(systemName: "plus.circle")
//                        .font(.title)
//                        .foregroundColor(.primary)
//                })
//
//                Spacer()
//
//                Button(action: {
//
//                }, label: {
//                    Image(systemName: "message")
//                        .font(.title)
//                        .foregroundColor(.primary)
//                })
//            }
//            .padding(.horizontal)
//            .overlay(
//                Text("USER")
//                    .font(.title2)
//                    .fontWeight(.bold)
//            )
//
//            ScrollView(.vertical, showsIndicators: false) {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack{
//
//                        Button(action: {}, label: {
//                            Image(systemName: "person.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 55, height: 55)
//                                .clipShape(Circle())
//                        })
//                        .overlay(
//                            Image(systemName: "plus.circle.fill")
//                                .font(.title)
//                                .foregroundColor(.blue)
//                                .background(Color.white.clipShape(Circle()))
//                                .offset(x: 8, y: 5)
//                            , alignment: .bottomTrailing
//                        )
//                    }
//                    .padding()
//                }
//                Divider()
//                    .padding(.horizontal)
//
//                VStack{
//
//                }
//            }
//        }
//        .padding(.top, edges?.top ?? 15)
//    }
