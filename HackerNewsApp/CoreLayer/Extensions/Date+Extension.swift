//
//  Date+Extension.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case fullDate = "yyyy-MM-dd'T'HH:mm:sssZ"
    case dateWithoutTime = "yyyy-MM-dd"
    case timeOnly = "HH:mm"
}

extension Date {
    func toString(format: DateFormat = .dateWithoutTime, timeZone: TimeZone = TimeZone.current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
}
