//
//  City.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct City: Decodable {
    private var country: String?
    private var name: String?
    private var sunrise: Double
    private var sunset: Int
    private var timezone: Int
    
    func cityName() -> String {
        guard let cityname = name else { return Constants.na }
        return cityname
    }
}
