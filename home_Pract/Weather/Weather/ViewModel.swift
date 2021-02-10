//
//  ViewModel.swift
//  Weather
//
//  Created by Tuan on 10/02/2021.
//

import Foundation

class WeatherViewModel: ObservableObject{
    @Published var title        : String = "-"
    @Published var description  : String = "-"
    @Published var temperature  : String = "-"
    @Published var timezone     : String = "-"
 
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=51.5060118&lon=-2.56559&exclude=hourly,daily&units=metric&appid=035ac371f9951c27c9439d372caebd61"
        ) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.description = model.current.weather.first?.description ?? "No Description"
                    self.temperature = "\(model.current.temp) degree"
                    self.timezone = model.timezone
                }
            } catch {
                print("Connection Failed")
            }
            
        }
        
        task.resume()
    }
}
