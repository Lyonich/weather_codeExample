//
//  Constants.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

enum Constants {
    static let apiKey = "2739195fd54d17b32f4c0ee5deca424a"
    static let na = "N/A"
    static let metric = "metric"
    static let imperial = "imperial"
    static let celsiumSymbol = " ℃"
    static let fahrenheitSymbol = " °F"
    
    static let meterInSeconds = " m/s"
    static let mileInSeconds = " mile/s"
    
    static let meters = " m"
    
    static let unitsUserDefaultKey = "isMetricUnits"
}

enum DirectionConstants {
    static let north = "N"
    static let northEast = "NE"
    static let east = "E"
    static let southEast = "SE"
    static let south = "S"
    static let southWest = "SW"
    static let west = "W"
    static let northWest = "NW"
}

enum LanguagesConstant {
    static let russian = "Русский"
    static let english = "English"
    
    static let en = "en"
    static let ru = "ru"
}

enum ApiURL {
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    static let fiveDayWeather = ApiURL.baseURL + "forecast"
    static let currentWeather = ApiURL.baseURL + "weather"
    static let baseIcon = "https://openweathermap.org/img/wn/"
    static let imageExtension = "@2x.png"
}
