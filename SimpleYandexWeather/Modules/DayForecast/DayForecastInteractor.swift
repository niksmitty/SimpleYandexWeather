//
//  DayForecastInteractor.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

class DayForecastInteractor {
    
    weak var presenter: DayForecastInteractorOutputProtocol!
    
    required init(presenter: DayForecastInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
}

// MARK: - DayForecastInteractorProtocol methods

extension DayForecastInteractor: DayForecastInteractorProtocol {
    
}
