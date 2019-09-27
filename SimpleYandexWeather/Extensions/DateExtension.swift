//
//  DateExtension.swift
//  SimpleYandexWeather
//
//  Created by Никита on 27/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

extension Date {

    func string(with formatter: DateFormatter) -> String {
        return formatter.string(from: self)
    }

}
