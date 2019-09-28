//
//  DayForecastProtocols.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

protocol DayForecastViewProtocol: class {
    func configureNavigationBar(_ title: String)
}

protocol DayForecastPresenterProtocol: class {
    func configureView()
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
