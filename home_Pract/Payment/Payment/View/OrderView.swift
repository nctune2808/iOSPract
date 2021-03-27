//
//  OrderView.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

struct OrderView: View {
    
    @Binding var memberList: [Member]
    var body: some View {
        Button(action: {
            print(memberList)
        }, label: {
            Text("Test Call")
        })
    }

}


