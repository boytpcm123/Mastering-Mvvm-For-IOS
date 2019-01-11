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
        
//        if let weatherVM = weatherViewModel {
//            cityNameLabel.text = weatherVM.name.value;
//            currentTempLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
//            maxTempLabel.text = weatherVM.currentTemperature.temperatureMax.value.formatAsDegree
//            minTempLabel.text = weatherVM.currentTemperature.temperatureMin.value.formatAsDegree
//        }
        
        setupVMBindings()

    }
    
    private func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.name.bind{ self.cityNameLabel.text = $0 }
            weatherVM.currentTemperature.temperature.bind {
                self.currentTempLabel.text = $0.formatAsDegree
            }
            weatherVM.currentTemperature.temperatureMax.bind {
                self.maxTempLabel.text = $0.formatAsDegree
            }
            weatherVM.currentTemperature.temperatureMin.bind {
                self.minTempLabel.text = $0.formatAsDegree
            }
            
            // Change the value after few seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.weatherViewModel?.name.value = "Boston"
            }
        }
    }
  
}
