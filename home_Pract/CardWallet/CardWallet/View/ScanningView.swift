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
                    ForEach(recognizedText.indices, id: \.self) {item in
                        HStack{
                            Text(recognizedText[item])
                            Spacer()
                            Button(action: {insertProducts(item: item)}) {
                                Image(systemName: "xmark.circle.fill")
                            }
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
              
                .navigationBarTitle("Scan", displayMode: .inline)
            }
    }
    
    func insertProducts(item: Int) {
        
        recognizedText.remove(at: item)
        productData = []
        for i in 0..<(recognizedText.count / 2) {
            if isNumber(string: recognizedText[2*i+1]) {
//                print(recognizedText[2*i], ":" , recognizedText[2*i+1], "->" ,isNumber(string: recognizedText[2*i+1]))
                productData.append(
                    Product( name: recognizedText[2*i],
                            price: toNumber(string: recognizedText[2*i+1]),
                            repeated: 0
                    )
                )
            }
        }
    }
    
    func isEnough() -> Bool {
        if recognizedText.count % 2 == 0 && !productData.isEmpty{
            if (recognizedText.count / 2 == productData.count)  {
                return true
            }
        }
        return false
    }
    
    func isNumber(string: String) -> Bool {
        return Int(string.replacingOccurrences(of: " ", with: "")) != nil
    }
    
    func toNumber(string: String) -> Double {
        return (string.replacingOccurrences(of: " ", with: "") as NSString).doubleValue / 100
    }

}

