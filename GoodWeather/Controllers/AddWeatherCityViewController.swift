//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by hungdat1234 on 12/31/18.
//  Copyright © 2018 ninjaKID. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=5a1c1b5faf73adc9afcc1517d244b6e7&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { result in
                if let weatherVM = result {
                    if let delegate = self.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
            
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
 
}
