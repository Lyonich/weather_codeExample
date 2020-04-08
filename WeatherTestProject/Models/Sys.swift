//
//  Sys.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct Sys: Decodable {
    private var country: String?
    private var sunrise: Int?
    private var sunset: Int?
    
    func stringSunset() -> String {
        guard let sunset = sunset else {
            return "sunset".localized() + Constants.na
        }
        
        return "sunset".localized() + DateHelper.instance.getHours(date: sunset)
    }
    
    func stringSunrise() -> String {
        guard let sunrise = sunrise else {
            return "sunrise".localized() + Constants.na
        }
        
        return "sunrise".localized() + DateHelper.instance.getHours(date: sunrise)
    }
}
