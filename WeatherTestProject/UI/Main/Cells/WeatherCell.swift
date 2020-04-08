//
//  WeatherCell.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit


class WeatherCell: UITableViewCell {

    @IBOutlet weak private var weatherImageView: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var weatherLabel: UILabel!
    
    func configure(with model: List) {
        weatherImageView.kf.setImage(with: model.weatherImageURL())
        timeLabel.text = model.hours()
        weatherLabel.text = model.weatherText()
    }

}
