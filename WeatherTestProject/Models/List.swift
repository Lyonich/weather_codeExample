//
//  List.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct List: Decodable {
    private var dt : Int?
    private var main : Main?
    private var weather: [Weather]?
    private var clouds : Clouds?
    private var wind : Wind?
    private var rain : Rain?
    private var dt_txt : String?
    
    func weatherImageURL() -> URL? {
        return weather?.first?.getImageURL()
    }
    
    func weatherText() -> String {
        guard let weatherModel = weather?.first else { return Constants.na }
        return weatherModel.desriptionText() + ", " + (main?.temperature() ?? Constants.na)
    }
    
    func hours() -> String {
        guard let date = dt else { return Constants.na }
        return DateHelper.instance.getHours(date: date)
    }
    
    func dayname() -> String {
        guard let date = dt else { return Constants.na }
        return DateHelper.instance.getDayname(date: date)
    }
}
