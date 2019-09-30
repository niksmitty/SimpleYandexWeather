//
//  ForecastService.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

protocol ForecastService {
    func getForecastInfo(latitude: String, longitude: String, completion: @escaping (_ forecastInfo: ForecastInfo?, _ error: String?) -> Void)
}
