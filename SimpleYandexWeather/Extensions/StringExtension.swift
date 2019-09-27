//
//  StringExtension.swift
//  SimpleYandexWeather
//
//  Created by Никита on 27/09/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import Foundation

extension String {

    func date(with formatter: DateFormatter) -> Date? {
        return formatter.date(from: self)
    }

    func customDateString(with inputFormat: String,
                          and outputFormat: String,
                          and dateStyle: DateFormatter.Style = .medium,
                          and timeStyle: DateFormatter.Style = .none,
                          hasRelativeDate: Bool = true) -> String? {
        if let date = self.date(with: DateFormatter.buildFormatter(dateStyle: dateStyle,
                                                                   timeStyle: timeStyle,
                                                                   dateFormat: inputFormat,
                                                                   timeZone: TimeZone(abbreviation: "UTC"))) {

            if hasRelativeDate {
                let relativeDateString = date.string(with: DateFormatter.buildFormatter(dateStyle: dateStyle,
                                                                                        timeStyle: timeStyle,
                                                                                        hasRelativeDate: hasRelativeDate))
                let normalDateString = date.string(with: DateFormatter.buildFormatter(dateStyle: dateStyle,
                                                                                      timeStyle: timeStyle))
                let customDateString = date.string(with: DateFormatter.buildFormatter(dateStyle: dateStyle,
                                                                                      timeStyle: timeStyle,
                                                                                      dateFormat: outputFormat))

                let dateString = relativeDateString == normalDateString ? customDateString : relativeDateString

                return dateString
            } else {
                return date.string(with: DateFormatter.buildFormatter(dateStyle: dateStyle,
                                                                                      timeStyle: timeStyle,
                                                                                      dateFormat: outputFormat))
            }

        } else {
            return nil
        }
    }
}
