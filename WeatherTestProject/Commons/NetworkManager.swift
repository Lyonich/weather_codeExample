//
//  NetworkManager.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import Foundation
import Alamofire
import Localize_Swift

class NetworkManager {
    static let instance = NetworkManager()
    
    func getWeather(for lat: Double, lon: Double, completion: @escaping (Result<FiveDayResponse, AFError>) -> Void) {
        AF.request(ApiURL.fiveDayWeather, method: .get, parameters: ["lat": lat, "lon": lon, "appid": Constants.apiKey, "units": SettingsManager.getUnits().keyForRequest(), "lang": Localize.currentLanguage() ], headers: .default).responseDecodable(of: FiveDayResponse.self) { (response) in
            completion(response.result)
        }
    }
    
    func getCurrentWeather(for lat: Double, lon: Double, completion: @escaping (Result<CurrentDayResponse, AFError>) -> Void) {
        AF.request(ApiURL.currentWeather, method: .get, parameters: ["lat": lat, "lon": lon, "appid": Constants.apiKey, "units":SettingsManager.getUnits().keyForRequest(), "lang": Localize.currentLanguage()], headers: .default).responseDecodable(of: CurrentDayResponse.self) { (response) in
            completion(response.result)
        }
    }
}


