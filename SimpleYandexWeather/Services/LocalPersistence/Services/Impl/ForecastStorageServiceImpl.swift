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
            database.fetch(DBDayForecastItem.self).map {
                DayForecastItem(day: $0.day,
                                dayIconUrl: $0.dayIconUrl,
                                dayTemperature: $0.dayTemperature,
                                nightIconUrl: $0.nightIconUrl,
                                nightTemperature: $0.nightTemperature,
                                hours: $0.hours.map {
                                    HourForecastItem(hour: $0.hour, iconUrl: $0.iconUrl, temperature: $0.temperature)
                                })
            }
    }
    
    func updateDayForecastItems(_ items: [DayForecastItem]) {
        let dbItems = items.map { item -> DBDayForecastItem in
            let dbItem = DBDayForecastItem()
            dbItem.day = item.day
            dbItem.dayIconUrl = item.dayIconUrl
            dbItem.dayTemperature = item.dayTemperature
            dbItem.nightIconUrl = item.nightIconUrl
            dbItem.nightTemperature = item.nightTemperature
            
            let hourItems = item.hours.map { hourItem -> DBHourForecastItem in
                let dbHourItem = DBHourForecastItem()
                dbHourItem.hour = hourItem.hour
                dbHourItem.iconUrl = hourItem.iconUrl
                dbHourItem.temperature = hourItem.temperature
                return dbHourItem
            }
            
            let hours = List<DBHourForecastItem>()
            hours.append(objectsIn: hourItems)
            
            dbItem.hours.append(objectsIn: hours)
            return dbItem
        }
        
        do {
            try database.deleteAll(DBDayForecastItem.self)
            try database.deleteAll(DBHourForecastItem.self)
            try database.save(objects: dbItems)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
