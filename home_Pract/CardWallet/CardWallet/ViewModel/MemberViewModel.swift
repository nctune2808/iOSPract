//
//  MemberViewModel.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

class MemberViewModel: ObservableObject{
    @Published var memberData = [Member]()
    
    init() {
        self.memberData = []
    }
}
