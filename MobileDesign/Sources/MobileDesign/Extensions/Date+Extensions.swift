//
//  Date+Extensions.swift
//  PlatformUI
//
//  Created by Khalid Asad on 12/16/20.
//  Copyright © 2020 Rogers Communication Inc. All rights reserved.
//

import Foundation

extension Date {
    
    static let dateFormatter: DateFormatter = {
        let instance = DateFormatter()
        instance.locale = Locale.userLocale
        return instance
    }()
    
    func toFormattedString(format: String) -> String {
        let dateFormatter = Date.dateFormatter
        dateFormatter.setLocalizedDateFormatFromTemplate(format)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.userLocale
        return dateFormatter.string(from: self)
    }
}
