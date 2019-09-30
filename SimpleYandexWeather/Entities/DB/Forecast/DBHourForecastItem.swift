//
//  DBHourForecastItem.swift
//  SimpleYandexWeather
//
//  Created by Никита on 30/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import RealmSwift

class DBHourForecastItem: Object {
    @objc dynamic var hour: String = ""
    @objc dynamic var iconUrl: String = ""
    @objc dynamic var temperature: Int = 0
}

extension DBHourForecastItem: DomainConvertibleType {
    
    func asDomain() -> HourForecastItem {
        return HourForecastItem(hour: hour,
                                iconUrl: iconUrl,
                                temperature: temperature)
    }
    
}

extension HourForecastItem: RealmRepresentable {
    
    func asRealm() -> DBHourForecastItem {
        return DBHourForecastItem.build { object in
            object.hour = hour
            object.iconUrl = iconUrl
            object.temperature = temperature
        }
    }
    
}
