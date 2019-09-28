//
//  DayForecastConfigurator.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

class DayForecastConfigurator: DayForecastConfiguratorProtocol {
    
    func configure(with viewController: DayForecastViewController,
                   and dayForecastItem: DayForecastItem) {
        let presenter = DayForecastPresenter(view: viewController,
                                             dayForecastItem: dayForecastItem)
        let interactor = DayForecastInteractor(presenter: presenter)
        let router = DayForecastRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
