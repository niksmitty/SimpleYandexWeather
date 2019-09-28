//
//  DayForecastPresenter.swift
//  SimpleYandexWeather
//
//  Created by Никита on 28/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

class DayForecastPresenter {
    
    weak var view: DayForecastViewProtocol!
    var interactor: DayForecastInteractorProtocol!
    var router: DayForecastRouterProtocol!
    
    private let dayForecastItem: DayForecastItem
    
    required init(view: DayForecastViewProtocol, dayForecastItem: DayForecastItem) {
        self.view = view
        self.dayForecastItem = dayForecastItem
    }
    
}

// MARK: - DayForecastPresenterProtocol methods

extension DayForecastPresenter: DayForecastPresenterProtocol {
    
    func configureView() {
        view.configureNavigationBar(dayForecastItem.day)
    }
    
}

// MARK: - DayForecastInteractorOutputProtocol methods

extension DayForecastPresenter: DayForecastInteractorOutputProtocol {
    
}
