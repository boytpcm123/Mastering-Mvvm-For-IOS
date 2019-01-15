//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Tran Tuyen on 1/13/19.
//  Copyright © 2019 ninjaKID. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String
    private var weatherListViewModel: WeatherListViewModel
    
    init(cellIdentifier: String, weatherListViewModel: WeatherListViewModel) {
        self.cellIdentifier = cellIdentifier
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
