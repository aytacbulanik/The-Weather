//
//  WeatherManager.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 30.09.2024.
//

import Foundation

struct WeatherManager   {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric"
    
    func fetchWeather(cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
}
