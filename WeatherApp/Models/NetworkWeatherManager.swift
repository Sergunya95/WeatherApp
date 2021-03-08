//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by apple on 3/9/21.
//

import Foundation

struct NetworkWeatherManager {
    
    func fetchCurrentWeather(forCity city: String)  {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let sesion = URLSession(configuration: .default)
        let task = sesion.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
    
}
