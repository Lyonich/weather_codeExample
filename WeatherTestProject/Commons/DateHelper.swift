//
//  DateHelper.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation
import AFDateHelper

class DateHelper {
    
    static let instance = DateHelper()
    
    func getDays(dates: [Int]) -> [String] {
        var days = [String]()
        
        for date in dates {
            let day = Date(timeIntervalSince1970: TimeInterval(date)).toString(style: .weekday)
            
            if !days.contains(day) {
                days.append(day)
            }
        }
        
        return days
    }
    
    func getDayname(date: Int) -> String {
        return Date(timeIntervalSince1970: TimeInterval(date)).toString(style: .weekday).lowercased().localized()
    }
    
    func getHours(date: Int) -> String {
        return Date(timeIntervalSince1970: TimeInterval(date)).toString(format: .custom("h:mm a"))
    }
}
