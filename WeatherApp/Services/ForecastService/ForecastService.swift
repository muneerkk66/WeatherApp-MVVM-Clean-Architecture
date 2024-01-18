//
//  ForecastService.swift
//  WeatherApp
//
//  Created by Muneer K K on 12/01/2024.
//

import Combine
import Dependencies
import Foundation

protocol ForecastService {
    func fetchForecast(
        withCity city: String
    ) -> AnyPublisher<ForecastResponse, ForecastError>
}

private enum ForecastServiceKey: DependencyKey {
    static let liveValue: ForecastService = ForecastServiceLive()
}

extension DependencyValues {
    var forecastService: ForecastService {
        get { self[ForecastServiceKey.self] }
        set { self[ForecastServiceKey.self] = newValue }
    }
}
