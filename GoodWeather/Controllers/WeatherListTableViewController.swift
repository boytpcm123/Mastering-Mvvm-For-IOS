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
    private var datasource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.datasource = TableViewDataSource(cellIdentifier: "WeatherCell", numSections: 1, items: self.weatherListViewModel.weatherViewModels)  { cell, vm in
            
            cell.cityNameLabel.text = vm.name.value
            cell.temperatureLabel.text = vm.currentTemperature.temperature.value.formatAsDegree
            
        }
        self.tableView.dataSource = self.datasource
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
           prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingTableViewController" {
            prepareSegueForSettingTableViewController(segue: segue)
        } else if segue.identifier == "WeatherDetailViewController" {
            prepareSegueForWeatherDetailViewController(segue: segue)
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
    
    private func prepareSegueForWeatherDetailViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailVC = segue.destination as? WeatherDetailViewController , let indexPath = self.tableView.indexPathForSelectedRow else {
                return
        }
    
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailVC.weatherViewModel = weatherVM
   
        //weatherDetailVC.delegate = self
        
    }


    
    

}


extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.datasource.updateItems(self.weatherListViewModel.weatherViewModels)
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
