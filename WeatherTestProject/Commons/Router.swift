//
//  Router.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit

class Router {
    static func showSettingsController(from controller: UIViewController) {
        let settingsController = UIStoryboard(name: "Settings", bundle: nil).instantiateViewController(identifier: String(describing: SettingsViewController.self))
        controller.navigationController?.pushViewController(settingsController, animated: true)
    }
    
    static func showLanguageController(from controller: UIViewController) {
        let languageController = UIStoryboard(name: "Language", bundle: nil).instantiateViewController(identifier: String(describing: LanguageViewController.self))
        controller.navigationController?.pushViewController(languageController, animated: true)
    }
}
