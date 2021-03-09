//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by apple on 3/9/21.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let humidity: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case humidity
    }
}

struct Weather: Codable {
    let id: Int
}

struct Wind: Codable {
    let speed: Double
}
