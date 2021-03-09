//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by apple on 3/9/21.
//

import Foundation
struct CurrentWeather {
    let cityName: String
    
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let fellsLiketemperature: Double
    var fellsLiketemperatureString: String {
        return String(format: "%.0f", fellsLiketemperature)
    }
    
    let humidity: Double
    var humidityString: String {
        return String(format: "%.1f", humidity)
    }
    
    let conditionCode: Int
    var systemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
            
        default: return "nosign"
        }
    }
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.1f", windSpeed)
    }
    
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        fellsLiketemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id 
        humidity = currentWeatherData.main.humidity
        windSpeed = currentWeatherData.wind.speed
    }
    
}
