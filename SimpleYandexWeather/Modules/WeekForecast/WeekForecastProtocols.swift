//
//  WeekForecastProtocols.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

protocol WeekForecastViewProtocol: class {
    func configureNavigationBar(_ title: String)
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
    func cellSelected(at indexPath: IndexPath)
}

protocol WeekForecastInteractorOutputProtocol: class {
    func locationDidUpdate(_ coordinate: Coordinate)
    func hideIndicators()
    func handleSuccess(with forecastItems: [DayForecastItem])
    func handleError(_ errorString: String)
}

protocol WeekForecastInteractorProtocol: class {
    var currentCoordinate: Coordinate? { get }
    func getForecastInfo(with coordinate: Coordinate)
}

protocol WeekForecastRouterProtocol: class {
    func showDayForecast(with dayForecastItem: DayForecastItem)
}

protocol WeekForecastConfiguratorProtocol: class {
    func configure(with viewController: WeekForecastViewController)
}
