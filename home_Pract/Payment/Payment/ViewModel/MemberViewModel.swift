//
//  MemberViewModel.swift
//  Payment
//
//  Created by Tuan on 26/03/2021.
//

import SwiftUI

class MemberViewModel: ObservableObject{
    @Published var mems = [
        Member(name: "A"),
        Member(name: "B"),
        Member(name: "C"),
        Member(name: "D")
    ]
}

