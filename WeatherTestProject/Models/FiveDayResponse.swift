//
//  Response.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct FiveDayResponse: Decodable {
    private var city: City?
    private var list: [List]?
    
    func days() -> [String] {
        var days = [String]()
        if let dayNames = list?.compactMap({ $0.dayname() }) {
            for dayName in dayNames {
                if !days.contains(dayName) {
                    days.append(dayName)
                }
            }
        }
        
        return days
    }
    
    func getModels(for day: String) -> [List]  {
        return list?.filter({ $0.dayname() == day }) ?? [List]()
    }
    
    func cityName() -> String {
        guard let cityModel = city else { return Constants.na }
        return cityModel.cityName()
    }
}
