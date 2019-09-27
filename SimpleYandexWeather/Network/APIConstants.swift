//
//  APIConstants.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

enum APIConstants {
    
    enum Server {
        
        case dev
        
        var urlString: String {
            switch self {
            case .dev:
                return "https://api.weather.yandex.ru/v1"
            }
        }
        
        var url: URL {
            return URL(string: self.urlString)!
        }
        
        var headerFields: [String: String] {
            switch self {
            case .dev:
                return ["X-Yandex-API-Key": "3a66106d-18d7-4f6a-af5e-aa6dfe4cbd90"]
            }
        }
        
    }
    
}
