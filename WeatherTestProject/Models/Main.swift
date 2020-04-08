//
//  Main.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct Main: Decodable {
    private var temp : Double?
    private var temp_min : Double?
    private var temp_max : Double?
    private var pressure : Double?
    private var sea_level : Double?
    private var grnd_level : Double?
    private var humidity : Int?
    private var temp_kf : Double?
    
    func temperature() -> String {
        guard let temperature = temp else { return Constants.na }
        return String(Int(temperature)) + SettingsManager.getUnits().temperatureSymbol()
    }
}
