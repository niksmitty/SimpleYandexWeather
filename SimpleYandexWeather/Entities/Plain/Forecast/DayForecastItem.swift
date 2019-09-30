//
//  DayForecastItem.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

struct DayForecastItem {
    let day: String
    let dayIconUrl: String
    let dayTemperature: Int
    let nightIconUrl: String
    let nightTemperature: Int
    let hours: [HourForecastItem]
}

extension DayForecastItem {
    
    static func dayForecastItems(from forecastInfo: ForecastInfo) -> [DayForecastItem] {
        let iconsUrlPattern = ServiceLayer.shared.configuration.iconsUrlPattern
        return forecastInfo.forecasts.map {
                DayForecastItem(day: $0.date,
                                dayIconUrl: String(format: iconsUrlPattern,
                                                   $0.parts.dayShort.icon),
                                dayTemperature: $0.parts.dayShort.temp,
                                nightIconUrl: String(format: iconsUrlPattern,
                                                     $0.parts.nightShort.icon),
                                nightTemperature: $0.parts.nightShort.temp,
                                hours: $0.hours.map { HourForecastItem(hour: $0.hour,
                                                                       iconUrl: String(format: iconsUrlPattern, $0.icon),
                                                                       temperature: $0.temp) })
        }
    }
    
    static func transformDaysFormat(for items: [DayForecastItem]) -> [DayForecastItem] {
        return items.map {
            DayForecastItem(day: $0.day.customDateString(with: Const.inputDateFormatString,
                                                         and: Const.outputDateFormatString) ?? $0.day,
                            dayIconUrl: $0.dayIconUrl,
                            dayTemperature: $0.dayTemperature,
                            nightIconUrl: $0.nightIconUrl,
                            nightTemperature: $0.nightTemperature,
                            hours: $0.hours)
        }
    }
    
}

// MARK: - Constants

extension DayForecastItem {
    private enum Const {
        static let inputDateFormatString = "yyyy-MM-dd"
        static let outputDateFormatString = "d MMMM"
    }
}
