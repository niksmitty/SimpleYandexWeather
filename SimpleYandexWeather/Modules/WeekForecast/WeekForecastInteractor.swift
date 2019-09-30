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
    private let forecastStorageService: ForecastStorageService
    
    required init(presenter: WeekForecastInteractorOutputProtocol,
                  forecastService: ForecastService = ServiceLayer.shared.forecastService,
                  forecastStorageService: ForecastStorageService = ServiceLayer.shared.forecastStorageService) {
        self.presenter = presenter
        self.forecastService = forecastService
        self.forecastStorageService = forecastStorageService
        self.forecastStorageService.observeDayForecastItemsUpdates {
            self.presenter.handleSuccess(with: self.fetchDayForecastItems())
        }
    }
    
    private func dayForecastItems(from forecastInfo: ForecastInfo) -> [DayForecastItem] {
        return
            forecastInfo.forecasts.map {
                DayForecastItem(day: $0.date,
                                dayIconUrl: String(format: iconsUrlPattern,
                                                   $0.parts.dayShort.icon),
                                dayTemperature: $0.parts.dayShort.temp,
                                nightIconUrl: String(format: iconsUrlPattern,
                                                     $0.parts.nightShort.icon),
                                nightTemperature: $0.parts.nightShort.temp,
                                hours: $0.hours.map { HourForecastItem(hour: $0.hour, iconUrl: $0.icon, temperature: $0.temp) })
        }
    }
    
    private func fetchDayForecastItems() -> [DayForecastItem] {
        return forecastStorageService.fetchDayForecastItems()
    }
    
}

// MARK: - WeekForecastInteractorProtocol methods

extension WeekForecastInteractor: WeekForecastInteractorProtocol {
    
    func getForecastInfo(with latitude: String, and longitude: String) {
        presenter.handleSuccess(with: fetchDayForecastItems())
        
        forecastService.getForecastInfo(latitude: latitude, longitude: longitude) { forecastInfo, error in
            guard error == nil, let forecastInfo = forecastInfo else {
                self.presenter.hideIndicators()
                self.presenter.handleError(String(describing: error))
                return
            }
            
            let items = self.dayForecastItems(from: forecastInfo)
            self.forecastStorageService.updateDayForecastItems(items)
            self.presenter.hideIndicators()
        }
    }
    
    var iconsUrlPattern: String {
        return ServiceLayer.shared.configuration.iconsUrlPattern
    }
    
}
