//
//  UnitsCell.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 01/04/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit

protocol UnitsCellDelegate: class {
    func didChangeUnitsType( _ type: Units)
}

class UnitsCell: UITableViewCell {
    
    @IBOutlet weak private var segmentControl: UISegmentedControl!
    
    weak var delegate: UnitsCellDelegate?
    
    func setType(_ type: Units) {
        segmentControl.selectedSegmentIndex = type.rawValue
        segmentControl.setTitle("metric".localized(), forSegmentAt: 0)
        segmentControl.setTitle("imperial".localized(), forSegmentAt: 1)
    }

    // MARK: - Actions
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        guard let type = Units(rawValue: sender.selectedSegmentIndex) else { return }
        delegate?.didChangeUnitsType(type)
    }
}
