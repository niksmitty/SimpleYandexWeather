//
//  ServiceLayer.swift
//  SimpleYandexWeather
//
//  Created by Никита on 26/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

final class ServiceLayer {
    
    static let shared = ServiceLayer()
    
    private(set) lazy var forecastService: ForecastService = ForecastServiceImpl(client: apiClient)
    private(set) lazy var forecastStorageService: ForecastStorageService = ForecastStorageServiceImpl(database: database)
    
    public let configuration = APIConfiguration()
    
    private var apiClient: APIClient
    private var database: DatabaseManagerProtocol
    
    private init() {
        self.apiClient = APIClient()
        self.database = DatabaseManager()
    }
    
}
