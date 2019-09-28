//
//  WeekForecastProtocols.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

protocol WeekForecastViewProtocol: class {
    func configureRefreshControl(_ title: String)
    func configureTableView()
    func registerCell(_ nibName: String, _ reuseIdentifier: String)
    func reloadData()
    func showProgress()
    func hideProgress()
    func hideRefreshControl()
}

protocol WeekForecastPresenterProtocol: class {
    var reuseIdentifier: String { get }
    var sectionHeaderHeight: Double { get }
    var sectionFooterHeight: Double { get }
    func configureView()
    func refreshForecast()
    var itemsCount: Int { get }
    func item(atIndex indexPath: IndexPath) -> DayForecastItem?
}

protocol WeekForecastInteractorOutputProtocol: class {
    func hideIndicators()
    func handleSuccess(with forecastInfo: ForecastInfo)
    func handleError(_ errorString: String)
}

protocol WeekForecastInteractorProtocol: class {
    func getForecastInfo(with latitude: String, and longitude: String)
    var iconsUrlPattern: String { get }
}

protocol WeekForecastRouterProtocol: class {
    
}

protocol WeekForecastConfiguratorProtocol: class {
    func configure(with viewController: WeekForecastViewController)
}
