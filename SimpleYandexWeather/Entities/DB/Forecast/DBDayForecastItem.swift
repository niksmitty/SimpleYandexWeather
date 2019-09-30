//
//  DBDayForecastItem.swift
//  SimpleYandexWeather
//
//  Created by Никита on 29/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import RealmSwift

class DBDayForecastItem: Object {
    @objc dynamic var day: String = ""
    @objc dynamic var dayIconUrl: String = ""
    @objc dynamic var dayTemperature: Int = 0
    @objc dynamic var nightIconUrl: String = ""
    @objc dynamic var nightTemperature: Int = 0
    let hours = List<DBHourForecastItem>()
    
    override class func primaryKey() -> String? {
        return "day"
    }
}

extension DBDayForecastItem: DomainConvertibleType {
    
    func asDomain() -> DayForecastItem {
        return DayForecastItem(day: day,
                               dayIconUrl: dayIconUrl,
                               dayTemperature: dayTemperature,
                               nightIconUrl: nightIconUrl,
                               nightTemperature: nightTemperature,
                               hours: hours.map { $0.asDomain() })
    }
    
}

extension DayForecastItem: RealmRepresentable {
    
    func asRealm() -> DBDayForecastItem {
        return DBDayForecastItem.build { object in
            object.day = day
            object.dayIconUrl = dayIconUrl
            object.dayTemperature = dayTemperature
            object.nightIconUrl = nightIconUrl
            object.nightTemperature = nightTemperature
            
            let hours = List<DBHourForecastItem>()
            hours.append(objectsIn: self.hours.map { $0.asRealm() })
            
            object.hours.append(objectsIn: hours)
        }
    }
    
}
