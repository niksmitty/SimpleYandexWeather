//
//  Forecast.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

struct Forecast: Codable {
    let date: String
    let parts: ForecastParts
    let hours: [ForecastHour]
}
