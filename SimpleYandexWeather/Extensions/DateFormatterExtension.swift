//
//  DateFormatterExtension.swift
//  SimpleYandexWeather
//
//  Created by Никита on 27/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

extension DateFormatter {

    static func buildFormatter(dateStyle: Style = .medium, timeStyle: Style = .short, hasRelativeDate: Bool = false, dateFormat: String? = nil, timeZone: TimeZone? = nil) -> DateFormatter {
        let formatter = DateFormatter()
        if let timeZone = timeZone { formatter.timeZone = timeZone }
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.doesRelativeDateFormatting = hasRelativeDate
        if let dateFormat = dateFormat { formatter.dateFormat = dateFormat }
        return formatter
    }

}
