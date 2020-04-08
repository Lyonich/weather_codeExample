//
//  LanguageViewController.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 01/04/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit
import Localize_Swift

class LanguageViewController: UIViewController {
    
    private let dataSource = [LanguagesConstant.english, LanguagesConstant.russian]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "select_language".localized()
    }

}

extension LanguageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        
        if Localize.currentLanguage() == LanguagesConstant.en && indexPath.row == 0 {
            cell.accessoryType = .checkmark
        } else if Localize.currentLanguage() == LanguagesConstant.ru && indexPath.row == 1 {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

extension LanguageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.row == 0 {
            Localize.setCurrentLanguage(LanguagesConstant.en)
        } else {
            Localize.setCurrentLanguage(LanguagesConstant.ru)
        }
        
        title = "select_language".localized()
        tableView.reloadData()
    }
}
