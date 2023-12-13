//  WeatherData.swift
//  Created on 2023/12/13

import Foundation
struct WeatherData: Decodable {
    let cityCode: String
    let city: String
    let temperature: Double
    let conditions: String
 
}
