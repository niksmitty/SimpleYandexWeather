//
//  WeekForecastConfigurator.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

class WeekForecastConfigurator: WeekForecastConfiguratorProtocol {
    
    func configure(with viewController: WeekForecastViewController) {
        let presenter = WeekForecastPresenter(view: viewController)
        let interactor = WeekForecastInteractor(presenter: presenter)
        let router = WeekForecastRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
