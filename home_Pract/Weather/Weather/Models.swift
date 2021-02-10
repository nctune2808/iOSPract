//
//  Models.swift
//  Weather
//
//  Created by Tuan on 10/02/2021.
//

import Foundation

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
    
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
    
}
