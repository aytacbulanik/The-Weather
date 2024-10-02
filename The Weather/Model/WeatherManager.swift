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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else { return }
            
            if let weather = self.parseJSON(weatherData: data) {
                print(weather.weather[0].description)
            }
        }
        task.resume()
    }
    
    func parseJSON(weatherData : Data) -> WeatherData? {
        do {
            let decoder = JSONDecoder()
            let weather = try decoder.decode(WeatherData.self, from: weatherData)
            return weather
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
