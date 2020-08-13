//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Ratnesh Shukla on 12/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion:@escaping(WeatherModel?) -> ()) {
        let urlString = "https://samples.openweathermap.org/data/2.5/weather?q=\(city)&appid=439d4b804bc8187953eb36d2a8c26a02"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            guard let data = data, error == nil else { return }
            guard let response =  try? JSONDecoder().decode(WeatherModel.self, from: data) else { completion(nil); return }
            DispatchQueue.main.async {
                completion(response)
            }
        }.resume()
    }
}
