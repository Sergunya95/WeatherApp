//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by apple on 3/9/21.
//

import Foundation
import CoreLocation

class NetworkWeatherManager {
    
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onComplition: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forRequestType requestType: RequestType) {
        var urlString = ""
        switch requestType {
        case .cityName(let city): urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiKey)&units=metric"
        case .coordinate(let latitude, let longitude): urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&APPID=\(apiKey)&units=metric"
        }
        performRequest(withURLString: urlString)
    }
    

    
    
    fileprivate func performRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let sesion = URLSession(configuration: .default)
        let task = sesion.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather  = self.parseJSON(withData: data) {
                    self.onComplition?(currentWeather)
                }
            }
        }
        task.resume()
    }
 
    fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        
        do {
        
        let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
