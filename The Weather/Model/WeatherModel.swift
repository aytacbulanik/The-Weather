//
//  WeatherModel.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 3.10.2024.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName : String
    let temp : Double
    
    var tempatureString : String {
        String(format: "%.1f", temp) 
    }
    
    var conditionName : String {
        switch conditionId {
        case 200...232: return "tornado"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 701...781: return "wind"
        case 800: return "sun.max"
        case 801...804 : return "cloud"
        default : return "sun"
        }
    }
    
}
