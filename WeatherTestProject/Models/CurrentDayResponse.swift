//
//  CurrentDayResponse.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct CurrentDayResponse: Decodable {
    private var weather: [Weather]?
    private var main: Main?
    private var visibility: Int?
    private var wind: Wind?
    private var dt: Int?
    private var name: String?
    private var timezone: Double?
    private var sys: Sys?
    
    func sunset() -> String {
        guard let sys = sys else { return Constants.na}
        
        return sys.stringSunset()
    }
    
    func sunrise() -> String {
        guard let sys = sys else { return Constants.na }
        
        return sys.stringSunrise()
    }
    
    func stringVisibility() -> String {
        if let visibility = visibility {
            return  "visibility".localized() + String(visibility) + Constants.meters
        } else {
            return "visibility".localized() + Constants.na
        }
    }
    
    func weatherImageURL() -> URL? {
        return weather?.first?.getImageURL()
    }
    
    func description() -> String {
        return weather?.first?.desriptionText() ?? Constants.na
    }
    
    func temperature() -> String {
        return main?.temperature() ?? Constants.na
    }
    
    func stringWind() -> String {
        return "wind".localized() + windDirection() + " " + windSpeed() + SettingsManager.getUnits().speedSymbols()
    }
    
    private func windDirection() -> String {
        guard let windModel = wind else { return Constants.na}
        return windModel.direction()
    }
    
    private func windSpeed() -> String {
        guard let wind = wind else { return Constants.na }
        return wind.stringSpeed()
    }
}
