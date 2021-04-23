//
//  ScanningView.swift
//  CardWallet
//
//  Created by Tuan on 23/04/2021.
//

import SwiftUI

struct ScanningView: View {
        
    @State private var recognizedText : [String] = ["Tap button to start scanning"]
    @State private var showingScanningView = false
    
    @State var memberList = MemberViewModel()
    @State var productData : [Product] = []
    
    var body: some View {
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
                                                price: toNumber(string: recognizedText[2*i+1]),
                                                repeated: 0
                                        )
                                    )
                                }
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                            })
                        }
                        .padding()
                        .background(item % 2 == 0 ? Color.black.opacity(0.8) : Color.white)
                        .foregroundColor(item % 2 == 0 ? .white : .black)
                    }
                }
                .sheet(isPresented: $showingScanningView) {
                    ScanDocumentViewModel(recognizedText: self.$recognizedText)
                }
                

                HStack(spacing: 30) {
                   
                   Button(action: {
                        self.showingScanningView = true
                   }) {
                       Text("Let's Scan")
                   }
                   .padding()
                   .foregroundColor(.white)
                   .background(Capsule().fill(Color.blue))
                   
                   
                    NavigationLink(destination: ReceiptView(memberData: memberList.memberData, productData: productData), label: {
                        Text("Assign")
                    })
                    .padding()
                    .foregroundColor(.white)
                    .background(Capsule().fill(Color.green))
                    .disabled(!isEnough()).opacity(isEnough() ? 1 : 0.3)

                }
                .padding(.vertical, 5)
                .padding(.bottom, 40)
              
                .navigationBarTitle("Scan")
            }
    }
    
    func isEnough() -> Bool {
        if recognizedText.count % 2 == 0 && !productData.isEmpty {
            return true
        }
        return false
    }
    
    func toNumber(string: String) -> Double {
        return (string as NSString).doubleValue / 100
    }

}

