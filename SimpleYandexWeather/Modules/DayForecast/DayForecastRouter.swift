//
//  DayForecastRouter.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

class DayForecastRouter {
    
    weak var viewController: DayForecastViewController!
    
    required init(viewController: DayForecastViewController) {
        self.viewController = viewController
    }
    
}

// MARK: - DayForecastRouterProtocol methods

extension DayForecastRouter: DayForecastRouterProtocol {
    
}
