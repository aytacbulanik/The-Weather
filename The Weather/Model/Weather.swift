//
//  Weather.swift
//  The Weather
//
//  Created by Aytaç Bulanık on 2.10.2024.
//

import Foundation

struct WeatherData : Codable {
    let coord : Coord
    let weather : [Weather]
}

struct Weather : Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Coord : Codable {
    let lon: Double
    let lat: Double
}
