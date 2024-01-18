//
//  APIEnvironment+Live.swift
//  WeatherApp
//
//  Created by Muneer K K on 14/01/2024.
//

import Foundation

final class APIEnvironmentLive {
    fileprivate var currentEnvironment: Environment?

    init(currentEnvironment: Environment? = nil) {
        self.currentEnvironment = currentEnvironment
    }
}

extension APIEnvironmentLive: APIEnvironment {
    var environment: Environment {
        guard let currentEnvironment else {
            print("Environment not set. Initialize environment using apiKitEnvironment.initialize(with environment:)")
            return Environment.qa
        }
        return currentEnvironment
    }

    func set(to environment: Environment) {
        currentEnvironment = environment
    }
}
