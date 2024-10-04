//
//  WeatherManager.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 30.09.2024.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager : WeatherManager,  weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager   {
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=39d3bb501d19a7b5f5d9449a0d69b76c&units=metric"
    
    var delegate : WeatherManagerDelegate?
    func fetchWeather(cityName : String) {
        let urlString = "\(baseURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString : String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                delegate?.didFailWithError(error)
                return
            }
            
            guard let data else { return }
            guard let weather = self.parseJSON(weatherData: data) else { return }
            delegate?.didUpdateWeather(self, weather: weather)
        }
        task.resume()
    }
    
    func parseJSON(weatherData : Data)  -> WeatherModel? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temp: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
   
}
