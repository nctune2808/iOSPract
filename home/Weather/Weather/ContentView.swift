//
//  ContentView.swift
//  Weather
//
//  Created by Tuan on 10/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text(viewModel.timezone)
                Text(viewModel.title)
                Text(viewModel.description)
                Text(viewModel.temperature)
                
            }.navigationTitle("Weather MVVM")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
