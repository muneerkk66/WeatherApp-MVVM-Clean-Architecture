//
//  APIClient.swift
//  WeatherApp
//
//  Created by Muneer K K on 11/01/2024.
//

import Combine
import Dependencies
import Foundation

protocol APIClient {
    @discardableResult
    func request<Response: Decodable>(_ request: APIRequest<Response>) -> AnyPublisher<Response, ForecastError>
}

private enum APIClientKey: DependencyKey {
    static var liveValue: any APIClient = APIClientLive()
}

extension DependencyValues {
    var apiClient: any APIClient {
        get { self[APIClientKey.self] }
        set { self[APIClientKey.self] = newValue }
    }
}
