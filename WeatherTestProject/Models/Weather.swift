//
//  Weather.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    private var id : Int?
    private var main : String?
    private var description : String?
    private var icon: String?
    
    func getImageURL() -> URL? {
        guard let imageId = icon else { return nil }
        return URL(string: ApiURL.baseIcon + imageId + ApiURL.imageExtension)
    }
    
    func desriptionText() -> String {
        guard let text = description else { return Constants.na }
        return text
    }
}
