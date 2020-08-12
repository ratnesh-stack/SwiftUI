//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Ratnesh Shukla on 12/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    var body: some View {
        VStack {
            TextField("Enter city name", text: self.$weatherViewModel.cityName) {
                self.weatherViewModel.search()
            }
            Text(self.weatherViewModel.temperature)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
