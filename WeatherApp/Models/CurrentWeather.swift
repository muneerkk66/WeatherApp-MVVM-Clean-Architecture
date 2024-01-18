//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Muneer K K on 12/01/2024.
//

import Foundation
import MapKit

struct CurrentWeather {
    private let item: ForecastResponse

    var temperature: String {
        String(format: "%.1f", item.main.temperature)
    }

    var maxTemperature: String {
        String(format: "%.1f", item.main.maxTemperature)
    }

    var minTemperature: String {
        String(format: "%.1f", item.main.minTemperature)
    }

    var humidity: String {
        String(format: "%.1f", item.main.humidity)
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: item.coord.lat, longitude: item.coord.lon)
    }

    init(item: ForecastResponse) {
        self.item = item
    }
}
