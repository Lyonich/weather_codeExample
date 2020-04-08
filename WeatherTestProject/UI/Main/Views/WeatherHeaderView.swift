//
//  WeatherHeaderView.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit

class WeatherHeaderView: UIView {
    
    @IBOutlet weak private var sunriseLabel: UILabel!
    @IBOutlet weak private var sunsetLabel: UILabel!
    @IBOutlet weak private var windsLabel: UILabel!
    @IBOutlet weak private var visibilityLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var weatherImageView: UIImageView!
    
    func configure(with model: CurrentDayResponse) {
        sunsetLabel.text = model.sunset()
        sunriseLabel.text = model.sunrise()
        visibilityLabel.text = model.stringVisibility()
        weatherImageView.kf.setImage(with: model.weatherImageURL())
        weatherImageView.backgroundColor = .systemBackground
        descriptionLabel.text = model.description()
        temperatureLabel.text = model.temperature()
        
        windsLabel.text = model.stringWind()
    }
    
}
