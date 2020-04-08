//
//  Rain.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct Rain: Decodable {
    enum CodingKeys : String, CodingKey {
        // Do not put into constants, because Enums only support raw-value-literal
        case h = "3h"
    }
    
    private var h: Double?
}
