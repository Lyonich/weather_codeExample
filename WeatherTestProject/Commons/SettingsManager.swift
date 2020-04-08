//
//  SettingsManager.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 01/04/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

enum Units: Int {
    case metrics
    case imperial
    
    func keyForRequest() -> String {
        switch self {
        case .metrics:
            return Constants.metric
        case .imperial:
            return Constants.imperial
        }
    }
    
    func temperatureSymbol() -> String {
        switch self {
        case .metrics:
            return Constants.celsiumSymbol
        case .imperial:
            return Constants.fahrenheitSymbol
        }
    }
    
    func speedSymbols() -> String {
        switch self {
        case .metrics:
            return Constants.meterInSeconds
        case .imperial:
            return Constants.mileInSeconds
        }
    }
}

class SettingsManager {
    
    static func setUnits(_ type: Units) {
        UserDefaults.standard.set(type.rawValue, forKey: Constants.unitsUserDefaultKey)
    }
    
    /// Default value is metrics
    static func getUnits() -> Units {
        guard let type = UserDefaults.standard.value(forKey: Constants.unitsUserDefaultKey) as? Int else { return .metrics }
        guard let units = Units(rawValue: type) else { return .metrics }
        return units
    }
}
