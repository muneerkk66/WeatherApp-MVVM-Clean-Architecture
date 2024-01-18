//
//  ForecastError.swift
//  WeatherApp
//
//  Created by Muneer K K on 14/01/2024.
//

import Foundation

enum ForecastError: LocalizedError {
    case connectionError
    case serverError(Error)
    case applicationError // TODO: (Rob) can represent internal error such as `notYetImplemented`

    var message: String {
        switch self {
        case .connectionError:
            return "Connection error"
        case .serverError, .applicationError:
            return "Something went wrong"
        }
    }
}

extension Error {
    var applicationError: ForecastError {
        if let error = self as? URLError {
            return error.code == .notConnectedToInternet
                ? .connectionError
                : .serverError(error)
        } else {
            return .applicationError
        }
    }
}
