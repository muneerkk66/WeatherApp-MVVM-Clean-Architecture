//
//  Parser.swift
//  WeatherApp
//
//  Created by Muneer K K on 14/01/2024.
//

import Combine
import Foundation

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, ForecastError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970

    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { _ in
            ForecastError.applicationError
        }
        .eraseToAnyPublisher()
}
