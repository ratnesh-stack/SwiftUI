//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ratnesh Shukla on 12/08/20.
//  Copyright © 2020 Ratnesh Shukla. All rights reserved.
//

import SwiftUI

struct WeatherModel: Decodable {
    var temp: String?
    var pressure: String?
    var humidity: String?
}
