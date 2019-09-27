//
//  WeekForecastRouter.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

class WeekForecastRouter {
    
    weak var viewController: WeekForecastViewController!
    
    required init(viewController: WeekForecastViewController) {
        self.viewController = viewController
    }
    
}

extension WeekForecastRouter: WeekForecastRouterProtocol {
    
}
