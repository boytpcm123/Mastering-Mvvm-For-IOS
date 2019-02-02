//
//  SettingsViewModelTests.swift
//  GoodWeatherTests
//
//  Created by hungdat1234 on 2/2/19.
//  Copyright © 2019 ninjaKID. All rights reserved.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {
    
    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        
        settingsVM = SettingsViewModel()
    }
    
    func testShouldReturnCorrectDisplayNameForFahrenhet() {
        XCTAssertEqual(settingsVM.selectedUnit.displayName, "Fahrenheit")
    }

    func testShouldMakeSureThatDefaultSelectedUinitIsFahrenheit() {
        
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
        
    }
    
    func testShouldBeAbleToSaveUnitSelection() {
        settingsVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

}
