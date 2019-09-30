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
    private let locationService: LocationService
    
    required init(presenter: WeekForecastInteractorOutputProtocol,
                  forecastService: ForecastService = ServiceLayer.shared.forecastService,
                  forecastStorageService: ForecastStorageService = ServiceLayer.shared.forecastStorageService,
                  locationService: LocationService = ServiceLayer.shared.locationService) {
        self.presenter = presenter
        self.forecastService = forecastService
        self.forecastStorageService = forecastStorageService
        self.locationService = locationService
        self.locationService.delegate = self
        self.forecastStorageService.observeDayForecastItemsUpdates {
            self.presenter.handleSuccess(with: self.fetchDayForecastItems())
        }
    }
    
    private var _currentCoordinate: Coordinate?
    
    private func dayForecastItems(from forecastInfo: ForecastInfo) -> [DayForecastItem] {
        return DayForecastItem.dayForecastItems(from: forecastInfo)
    }
    
    private func fetchDayForecastItems() -> [DayForecastItem] {
        return forecastStorageService.fetchDayForecastItems()
    }
    
}

extension WeekForecastInteractor: LocationUpdateProtocol {
    
    func locationDidUpdate(to coordinate: Coordinate) {
        _currentCoordinate = coordinate
        presenter.locationDidUpdate(coordinate)
    }
    
}

// MARK: - WeekForecastInteractorProtocol methods

extension WeekForecastInteractor: WeekForecastInteractorProtocol {
    
    var currentCoordinate: Coordinate? {
        return _currentCoordinate
    }
    
    func getForecastInfo(with coordinate: Coordinate) {
        presenter.handleSuccess(with: fetchDayForecastItems())
        
        forecastService.getForecastInfo(latitude: "\(coordinate.latitude)", longitude: "\(coordinate.longitude)") { forecastInfo, error in
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
    
}
