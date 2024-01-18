//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Muneer K K on 12/01/2024.
//

import Combine
import Dependencies
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var dataSource: CurrentWeather?
    private var disposables = Set<AnyCancellable>()
    @Dependency(\.forecastService) var forecastService
    private let scheduler: DispatchQueue = .init(label: "WeatherViewModel")

    init() {
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchForeCast)
            .store(in: &disposables)
    }

    func fetchForeCast(city: String) {
        forecastService
            .fetchForecast(withCity: city)
            .map(CurrentWeather.init)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = nil
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] weather in
                guard let self = self else { return }
                self.dataSource = weather
            })
            .store(in: &disposables)
    }
}
