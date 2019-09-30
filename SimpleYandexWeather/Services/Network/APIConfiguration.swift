//
//  APIConfiguration.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

final class APIConfiguration {
    
    var baseURL: String {
        return APIConstants.Server.dev.url.absoluteString
    }
    
    var headerFields: [String: String] {
        return APIConstants.Server.dev.headerFields
    }
    
    var iconsUrlPattern: String {
        return APIConstants.Server.dev.iconsUrlPattern
    }
    
}
