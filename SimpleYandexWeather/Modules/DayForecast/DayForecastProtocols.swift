//
//  DayForecastProtocols.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

protocol DayForecastViewProtocol: class {
    func configureNavigationBar(_ title: String)
    func registerCell(_ nibName: String, _ reuseIdentifier: String)
    func reloadData()
    func configureTableBackgroundView(_ itemsCount: Int, _ emptyMessage: String)
}

protocol DayForecastPresenterProtocol: class {
    var reuseIdentifier: String { get }
    var sectionHeaderHeight: Double { get }
    var sectionFooterHeight: Double { get }
    func configureView()
    var itemsCount: Int { get }
    func item(atIndex indexPath: IndexPath) -> HourForecastItem?
}

protocol DayForecastInteractorOutputProtocol: class {
    
}

protocol DayForecastInteractorProtocol: class {
    
}

protocol DayForecastRouterProtocol: class {
    
}

protocol DayForecastConfiguratorProtocol: class {
    func configure(with viewController: DayForecastViewController,
                   and dayForecastItem: DayForecastItem)
}
