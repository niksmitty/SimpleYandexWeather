//
//  WeekForecastInteractor.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

class WeekForecastInteractor {
    
    weak var presenter: WeekForecastInteractorOutputProtocol!
    
    private let forecastService: ForecastService
    
    required init(presenter: WeekForecastInteractorOutputProtocol,
                  forecastService: ForecastService = ServiceLayer.shared.forecastService) {
        self.presenter = presenter
        self.forecastService = forecastService
    }
    
}

// MARK: - WeekForecastInteractorProtocol methods

extension WeekForecastInteractor: WeekForecastInteractorProtocol {
    
    func getForecastInfo(with latitude: String, and longitude: String) {
        forecastService.getForecastInfo(latitude: latitude, longitude: longitude) { forecastInfo, error in
            self.presenter.reloadItems(with: forecastInfo!)
        }
    }
    
}
