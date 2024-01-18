//
//  ForecastService+Live.swift
//  WeatherApp
//
//  Created by Muneer K K on 11/01/2024.
//

import Combine
import Dependencies
import Foundation

final class ForecastServiceLive {
    @Dependency(\.apiClient) private var apiClient
    @Dependency(\.apiEnvironment) private var apiEnvirorment

    private enum Endpoint {
        case fetchWeatherForecast
        var path: String {
            switch self {
            case .fetchWeatherForecast:
                return "/data/2.5/weather"
            }
        }
    }
}

extension ForecastServiceLive: ForecastService {
    func fetchForecast(
        withCity city: String
    ) -> AnyPublisher<ForecastResponse, ForecastError> {
        let parms = [AppConstants.city: city,
                     AppConstants.appID:
                         apiEnvirorment.environment.apiKey,
                     AppConstants.units: AppConstants.metric]
        let fetchForecastRequest = APIRequest<ForecastResponse>(
            path: Self.Endpoint.fetchWeatherForecast.path,
            query: parms
        )
        return apiClient.request(fetchForecastRequest)
    }
}
