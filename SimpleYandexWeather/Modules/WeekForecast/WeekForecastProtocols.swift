//
//  WeekForecastProtocols.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

protocol WeekForecastViewProtocol: class {
    func registerCell(_ nibName: String, _ reuseIdentifier: String)
    func reloadData()
}

protocol WeekForecastPresenterProtocol: class {
    var reuseIdentifier: String { get }
    func configureView()
    var itemsCount: Int { get }
    func item(atIndex indexPath: IndexPath) -> DayForecast?
}

protocol WeekForecastInteractorOutputProtocol: class {
    func reloadItems(with forecastInfo: ForecastInfo)
}

protocol WeekForecastInteractorProtocol: class {
    func getForecastInfo(with latitude: String, and longitude: String)
}

protocol WeekForecastRouterProtocol: class {
    
}

protocol WeekForecastConfiguratorProtocol: class {
    func configure(with viewController: WeekForecastViewController)
}
