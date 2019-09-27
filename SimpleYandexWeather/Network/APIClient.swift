//
//  APIClient.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Alamofire

protocol APIClientProtocol {
    func request<Request>(with request: Request,
                          completion: @escaping (Request.Response?, Error?, Int?) -> Void
    ) -> DataRequest where Request: EndPointType, Request.Response: Codable
}

final class APIClient {
    
    private let sessionManager: SessionManager
    
    init() {
        self.sessionManager = SessionManager()
    }
    
    @discardableResult
    func request<Request>(with request: Request,
                          completion: @escaping (Request.Response?, Error?, Int?) -> Void
    ) -> DataRequest where Request: EndPointType, Request.Response: Codable {
        return sessionManager.request(request).validate().responseJSON { (jsonResponse: DataResponse<Any>) in
            let statusCode = jsonResponse.response?.statusCode
            guard jsonResponse.result.isSuccess, let data = jsonResponse.data else {
                completion(nil, jsonResponse.result.error, statusCode)
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Request.Response.self, from: data)
                completion(response, nil, statusCode)
            } catch {
                completion(nil, error, statusCode)
            }
        }
    }
    
}
