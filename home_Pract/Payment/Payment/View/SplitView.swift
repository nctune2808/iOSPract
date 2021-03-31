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


        ForEach(memberData) { members in
            
            Text("\(members.name) : \(members.total)")
                .font(.title)
                        
        }
        
    }

}



