//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by hungdat1234 on 1/11/19.
//  Copyright © 2019 ninjaKID. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let weatherVM = weatherViewModel {
            cityNameLabel.text = weatherVM.name;
            currentTempLabel.text = weatherVM.currentTemperature.temperature.formatAsDegree
            maxTempLabel.text = weatherVM.currentTemperature.temperatureMax.formatAsDegree
            minTempLabel.text = weatherVM.currentTemperature.temperatureMin.formatAsDegree
        }
        
        
    }
  
}
