//
//  ScanningView.swift
//  CardWallet
//
//  Created by Tuan on 23/04/2021.
//

import SwiftUI

struct ScanningView: View {
    
    @Binding var offset: CGFloat
    
    @State private var recognizedText : [String] = ["Tap button to start scanning"]
    @State private var showingScanningView = false
    @State var productData : [Product] = []
    @State var isSave : Bool = false
    
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
                                productData = []
                                for i in 0..<(recognizedText.count / 2) {
                                    productData.append(
                                        Product(name: recognizedText[2*i],
                                                price: recognizedText[2*i+1],
                                                repeated: 0
                                        )
                                    )
                                }
                                
//                                if recognizedText.count % 2 != 0 {
//                                    isSave = false
//                                } else {
//                                    isSave = true
//                                }
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

                HStack(spacing: 20) {
                   
                   Button(action: {
                       self.showingScanningView = true
                   }) {
                       Text("Scan")
                   }
                   .padding()
                   .foregroundColor(.white)
                   .background(Capsule().fill(Color.blue))
                    
                   
                    NavigationLink(destination: ReceiptView(productData: $productData), label: {
                        Text("Next")
                    })
                    .padding()
                    .foregroundColor(.white)
                    .background(Capsule().fill(Color.green))
                    .disabled(recognizedText.count % 2 != 0).opacity(recognizedText.count % 2 == 0 ? 1 : 0.3)
                    
                }
                .padding()
            }
            .navigationBarTitle("Supermarket")
            .sheet(isPresented: $showingScanningView) {
                ScanDocumentViewModel(recognizedText: self.$recognizedText)
            }
            
        }
        
    }
}

