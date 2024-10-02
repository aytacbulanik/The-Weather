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
    let name : String
    let main : Main
    let sys : SYS
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

struct Main : Codable {
    let temp: Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let pressure : Int
    let humidity : Int
}

struct SYS : Codable {
    let sunrise: Int
    let sunset: Int
}
