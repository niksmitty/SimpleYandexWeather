//
//  ForecastStorageServiceImpl.swift
//  SimpleYandexWeather
//
//  Created by Никита on 29/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import RealmSwift

final class ForecastStorageServiceImpl {
    
    private(set) var database: DatabaseManagerProtocol
    
    init(database: DatabaseManagerProtocol) {
        self.database = database
    }
    
}

extension ForecastStorageServiceImpl: ForecastStorageService {
    
    func observeDayForecastItemsUpdates(_ block: (() -> Void)?) {
        database.databaseContextNotification = block
    }
    
    func fetchDayForecastItems() -> [DayForecastItem] {
        return
            database.fetch(DBDayForecastItem.self).map { $0.asDomain() }
    }
    
    func updateDayForecastItems(_ items: [DayForecastItem]) {
        let dbItems = items.map { $0.asRealm() }
        
        do {
            try database.deleteAll(DBDayForecastItem.self)
            try database.deleteAll(DBHourForecastItem.self)
            try database.save(objects: dbItems)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
