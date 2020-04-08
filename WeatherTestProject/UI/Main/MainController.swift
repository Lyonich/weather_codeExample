//
//  ViewController.swift
//  WeatherTestProject
//
//  Created by Leonid Kibukevich on 31/03/2020.
//  Copyright © 2020 Leonid Kibukevich. All rights reserved.
//

import UIKit
import Kingfisher
import CoreLocation

class MainController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var tableHeaderView: WeatherHeaderView!
    @IBOutlet weak private var settingsBarItem: UIBarButtonItem!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    private var days = [String]()
    private var dataSource = [String: [List]]()
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let location = locationManager.location?.coordinate else { return }
        
        updateHeader(lat: location.latitude, lon: location.longitude)
        updateTableView(lat: location.latitude, lon: location.longitude)
        
        locationManager.startUpdatingLocation()
        
        settingsBarItem.title = "settings".localized()
    }
    
    // MARK: - Actions
    
    @IBAction func settingsBarAction(_ sender: Any) {
        Router.showSettingsController(from: self)
    }
    
    // MARK: - Private
    
    private func createDataSource(from model: FiveDayResponse) {
        days = model.days()
        
        for day in days {
            let lists = model.getModels(for: day)
            dataSource[day] = lists
        }
    }
    
    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    private func updateTableView(lat: Double, lon: Double) {
        configureUI(isLoading: true)
        NetworkManager.instance.getWeather(for: lat, lon: lon) { [weak self] result in
            switch result {
            case .success(let model):
                self?.createDataSource(from: model)
                
                DispatchQueue.main.async {
                    self?.title = model.cityName()
                    self?.tableView.reloadData()
                    self?.configureUI(isLoading: false)
                }
                
            case .failure(let error):
                self?.configureUI(isLoading: false)
                
                print(error)
            }
        }
    }
    
    private func configureUI(isLoading: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.isHidden = isLoading
            self?.activityIndicator.isHidden = !isLoading
        }
    }
    
    private func updateHeader(lat: Double, lon: Double) {
        NetworkManager.instance.getCurrentWeather(for: lat, lon: lon) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.tableHeaderView.configure(with: model)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

// MARK: - CLLocationManagerDelegate
extension MainController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        updateHeader(lat: locValue.latitude, lon: locValue.longitude)
        updateTableView(lat: locValue.latitude, lon: locValue.longitude)
        
        locationManager.stopUpdatingLocation()
    }
}

// MARK: - UITableViewDataSource
extension MainController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[days[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherCell.self), for: indexPath) as! WeatherCell
        cell.selectionStyle = .none
        if let model = dataSource[days[indexPath.section]]?[indexPath.row] {
            cell.configure(with: model)
        }
        
        return cell
    }
}
