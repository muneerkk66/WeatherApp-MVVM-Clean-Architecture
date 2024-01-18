//
//  ForecastResponse.swift
//  WeatherApp
//
//  Created by Muneer K K on 12/01/2024.
//

import Foundation

struct ForecastResponse: Decodable {
    let coord: Coord
    let main: Main
}

struct Main: Codable {
    let temperature: Double
    let humidity: Int
    let maxTemperature: Double
    let minTemperature: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity
        case maxTemperature = "temp_max"
        case minTemperature = "temp_min"
    }
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}
