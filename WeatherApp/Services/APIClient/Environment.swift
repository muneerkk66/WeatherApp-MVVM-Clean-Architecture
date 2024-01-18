//
//  Environment.swift
//  WeatherApp
//
//  Created by Muneer K K on 11/01/2024.
//

import ArkanaKeys
import Foundation

enum Environment: String, Codable, CaseIterable {
    case development = "dev"
    case qa
    case production = "prod"
}

extension Environment {
    var baseURL: URL {
        switch self {
        case .development:
            return URL(string: "https://api.openweathermap.org")!
        case .qa:
            return URL(string: "https://api.openweathermap.org")!
        case .production:
            return URL(string: "https://api.openweathermap.org")!
        }
    }

    var apiKey: String {
        switch self {
        case .development:
            return ArkanaKeys.Keys.Global().appId
        case .qa:
            return "26147ff119dd91e408c2531a64df7dc7"
        case .production:
            return "26147ff119dd91e408c2531a64df7dc7"
        }
    }
}
