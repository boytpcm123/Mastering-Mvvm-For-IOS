//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by hungdat1234 on 1/2/19.
//  Copyright © 2019 ninjaKID. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private var settingViewModels = SettingsViewModel()
    
    var delegate: SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @IBAction func done() {
        
        if let delegate = self.delegate {
            delegate.settingDone(vm: settingViewModels)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingViewModels.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = self.settingViewModels.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        cell.textLabel?.text = settingsItem.displayName
        if settingsItem == self.settingViewModels.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //unchecked all cell
        tableView.visibleCells.forEach { (cell) in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            self.settingViewModels.selectedUnit = unit
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    
    
}
