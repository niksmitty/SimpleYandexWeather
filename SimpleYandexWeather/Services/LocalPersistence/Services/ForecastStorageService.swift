//
//  ForecastStorageService.swift
//  SimpleYandexWeather
//
//  Created by Никита on 29/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

protocol ForecastStorageService {
    func observeDayForecastItemsUpdates(_ block: (() -> Void)?)
    func fetchDayForecastItems() -> [DayForecastItem]
    func updateDayForecastItems(_ items: [DayForecastItem])
}
