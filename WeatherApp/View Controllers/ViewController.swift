//
//  ViewController.swift
//  WeatherApp
//
//  Created by apple on 3/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    var networkWeathetManager = NetworkWeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presenSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert)
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeathetManager.fetchCurrentWeather(forCity: "London")
        
        
    }


}

