//
//  ProductView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct SplitView: View {
    
    @Binding var memberData: [Member]
    
    var body: some View {


        VStack {
            ForEach(memberData) { members in
                
                Text("\(members.name) : \(formatPrice(value: members.total))")
                    .font(.title)
            }
        }
        .navigationBarTitle("Total", displayMode: .inline)
        
        
    }
    
    func formatPrice(value: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.currencyCode = "GBP"
        return format.string(from: (NSNumber(value: value))) ?? ""
    }

}



