//
//  SettingsView.swift
//  CardWallet
//
//  Created by Tuan on 07/05/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        Text("Settings")
            .navigationBarTitle("Settings")
            .background(LinearGradient(gradient: themeLight, startPoint: .leading, endPoint: .trailing).ignoresSafeArea())

    }
}

