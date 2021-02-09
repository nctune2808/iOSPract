//
//  PlayerData.swift
//  Football
//
//  Created by Tuan on 09/02/2021.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    let avatar: String
    let image: String
    let name: String
    let type: String
    let color: Color
}

var playerList = [
    Player (avatar: "Messi_avt", image: "Messi", name: "Messi", type: "RW", color: .red),
    Player (avatar: "Stegen_avt", image: "Stegen", name: "Stegen", type: "GK", color: .blue)
]
