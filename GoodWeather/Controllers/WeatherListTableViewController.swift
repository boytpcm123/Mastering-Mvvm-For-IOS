//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by hungdat1234 on 12/31/18.
//  Copyright © 2018 ninjaKID. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
           prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingTableViewController" {
            prepareSegueForSettingTableViewController(segue: segue)
        }
        
        
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSegueForSettingTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTableVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        settingsTableVC.delegate = self
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
       
        return cell
        
    }

}


extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        tableView.reloadData()
    }
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingDone(vm: SettingsViewModel) {
        print("Settings Done")
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
