//
//  Wind.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct Wind: Decodable {
    private var speed : Double?
    private var deg : Float?

    func stringSpeed() -> String {
        guard let speed = speed else { return Constants.na}
        
        return String(format: "%.1f", speed)
    }
    
    func direction() -> String {
        guard let degrees = deg else { return Constants.na}
        if degrees > 0 && degrees < 20 {
            return DirectionConstants.north
        }
        
        if degrees >= 20 && degrees < 70 {
            return DirectionConstants.northEast
        }
        
        if degrees >= 70 && degrees < 110 {
            return DirectionConstants.east
        }
        
        if degrees >= 110 && degrees < 160 {
            return DirectionConstants.southEast
        }
        
        if degrees >= 160 && degrees < 200 {
            return DirectionConstants.south
        }
        
        if degrees >= 200 && degrees < 250 {
            return DirectionConstants.southWest
        }
        
        if degrees >= 250 && degrees < 290 {
            return DirectionConstants.west
        }
        
        if degrees >= 290 && degrees < 340 {
            return DirectionConstants.northWest
        }
        
        if degrees >= 340 {
            return DirectionConstants.north
        }
        
        return Constants.na
    }
}
