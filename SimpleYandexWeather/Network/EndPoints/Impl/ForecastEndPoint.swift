//
//  ForecastEndPoint.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation
import Alamofire

typealias ForecastResponse = ForecastInfo

enum ForecastEndPoint: EndPointType {
    
    typealias Response = ForecastResponse
    
    enum Constants {
        static let baseURLPath = ServiceLayer.shared.configuration.baseURL
        static let headerFields = ServiceLayer.shared.configuration.headerFields
    }
    
    case forecast(String, String)
    
    var baseURL: URL {
        return URL(string: Constants.baseURLPath)!
    }

    var method: HTTPMethod {
        switch self {
        case .forecast:
            return .get
        }
    }

    var path: String {
        switch self {
        case .forecast:
            return "/forecast"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .forecast(let latitude, let longitude):
            return ["lat": latitude, "lon": longitude]
        }
    }

    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        Constants.headerFields.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
