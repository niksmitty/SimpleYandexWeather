//
//  WeekForecastPresenter.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

class WeekForecastPresenter {
    
    weak var view: WeekForecastViewProtocol!
    var interactor: WeekForecastInteractorProtocol!
    var router: WeekForecastRouterProtocol!
    
    var items = [DayForecast]()
    
    required init(view: WeekForecastViewProtocol) {
        self.view = view
    }
    
    private func dayForecastItems(from forecastInfo: ForecastInfo) -> [DayForecast] {
        let daysForecast = forecastInfo.forecasts.map {
            DayForecast(day: $0.date,
                        dayIcon: $0.parts.dayShort.icon,
                        dayTemperature: $0.parts.dayShort.temp,
                        nightIcon: $0.parts.nightShort.icon,
                        nightTemperature: $0.parts.nightShort.temp)
        }
        return daysForecast
    }
    
}

// MARK: - WeekForecastPresenterProtocol methods

extension WeekForecastPresenter: WeekForecastPresenterProtocol {
    
    var reuseIdentifier: String {
        return Const.dayForecastReuseIdentifier
    }
    
    func configureView() {
        view.registerCell(Const.dayForecastCellNibName, Const.dayForecastReuseIdentifier)
        interactor.getForecastInfo(with: "55.75396", and: "37.620393")
    }
    
    var itemsCount: Int {
        return items.count
    }
    
    func item(atIndex indexPath: IndexPath) -> DayForecast? {
        guard items.indices.contains(indexPath.row) else { return nil }
        return items[indexPath.row]
    }
    
}

// MARK: - WeekForecastPresenterProtocol methods

extension WeekForecastPresenter: WeekForecastInteractorOutputProtocol {
    
    func reloadItems(with forecastInfo: ForecastInfo) {
        self.items = dayForecastItems(from: forecastInfo)
        view.reloadData()
    }
    
}

// MARK: - Constants

extension WeekForecastPresenter {
    private enum Const {
        static let dayForecastCellNibName = "DayForecastCell"
        static let dayForecastReuseIdentifier = "DayForecastCell"
    }
}
