//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ratnesh Shukla on 12/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    private var service: WeatherService!
    @Published var weather = WeatherModel()
    
    init() {
        self.service = WeatherService()
    }
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {return ""}
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(city: city)
        }
    }
    
    private func fetchWeather(city name: String) {
        self.service.getWeather(city: name) { weather in
            guard let weatherNotNil = weather else {return}
            self.weather = weatherNotNil
        }
    }
}
