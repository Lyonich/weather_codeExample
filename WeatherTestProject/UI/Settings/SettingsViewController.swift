//
//  SettingsViewController.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit
import Localize_Swift

class SettingsViewController: UIViewController {
    
    private var dataSource = [String]()

    @IBOutlet weak private var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = ["units".localized(), "language".localized()]
        title = "settings".localized()
        tableView.reloadData()
    }

}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UnitsCell.self), for: indexPath) as! UnitsCell
            cell.selectionStyle = .none
            cell.delegate = self
            cell.setType(SettingsManager.getUnits())
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        
        if Localize.currentLanguage() == LanguagesConstant.en {
            cell.textLabel?.text = LanguagesConstant.english
        } else {
            cell.textLabel?.text = LanguagesConstant.russian
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section]
    }
}


extension SettingsViewController: UnitsCellDelegate {
    func didChangeUnitsType(_ type: Units) {
        SettingsManager.setUnits(type)
    }
    
    
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            tableView.deselectRow(at: indexPath, animated: true)
            Router.showLanguageController(from: self)
        }

    }
}
