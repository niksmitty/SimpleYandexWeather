//
//  ForecastServiceImpl.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

final class ForecastServiceImpl: ForecastService {
    
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    // MARK: - Forecast Info
    
    func getForecastInfo(latitude: String, longitude: String, completion: @escaping (_ forecastInfo: ForecastInfo?, _ error: String?) -> Void) {
        client.request(with: ForecastEndPoint.forecast(latitude, longitude)) { forecastInfoResponse, error, _ in
            guard error == nil, let forecastInfo = forecastInfoResponse else {
                completion(nil, error?.localizedDescription)
                return
            }
            completion(forecastInfo, nil)
        }
    }
    
}
