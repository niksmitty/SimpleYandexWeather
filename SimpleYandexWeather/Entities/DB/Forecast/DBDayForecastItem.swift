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
    
    override class func primaryKey() -> String? {
        return "day"
    }
}
