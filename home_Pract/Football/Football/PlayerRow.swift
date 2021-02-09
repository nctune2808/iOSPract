//
//  PlayerRow.swift
//  Football
//
//  Created by Tuan on 09/02/2021.
//

import SwiftUI

struct PlayerRow: View {
    
    var player: Player
    
    var body: some View {
        HStack {
            Image(player.avatar).resizable().frame(width: 50, height: 60)
            Text(player.name)
            Spacer()
            Text(player.type).foregroundColor(player.color)
        }.navigationBarTitle(Text("FC.Barcelone"))
    }
    
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: playerList[0])
    }
}
