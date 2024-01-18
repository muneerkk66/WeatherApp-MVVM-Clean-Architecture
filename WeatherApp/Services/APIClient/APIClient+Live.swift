//
//  APIClient+Live.swift
//  WeatherApp
//
//  Created by Muneer K K on 11/01/2024.
//

import Combine
import Dependencies
import Foundation

final class APIClientLive: APIClient {
    @Dependency(\.apiEnvironment) private var apiEnvironment

    func request<Response>(_ request: APIRequest<Response>) -> AnyPublisher<Response, ForecastError> {
        do {
            let urlRequest = try request.makeRequest(using: apiEnvironment.environment.baseURL)
            print("Making API request:\n\(urlRequest)")
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .mapError { error in ForecastError.serverError(error)
                }
                .flatMap(maxPublishers: .max(1)) { pair in
                    decode(pair.data)
                }
                .eraseToAnyPublisher()
        } catch {
            let error = ForecastError.applicationError
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
