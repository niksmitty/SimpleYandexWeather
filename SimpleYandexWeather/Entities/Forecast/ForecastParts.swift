//
//  ForecastParts.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

struct ForecastParts: Codable {
    let dayShort: ForecastShortPart
    let nightShort: ForecastShortPart
}

extension ForecastParts {
    enum CodingKeys: String, CodingKey {
        case dayShort = "day_short"
        case nightShort = "night_short"
    }
}
