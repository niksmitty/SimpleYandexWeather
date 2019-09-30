//
//  EndPointType.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Alamofire

protocol EndPointType: URLRequestConvertible {

    associatedtype Response

    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
