//
//  TableViewDataSource.swift
//  GoodWeather
//
//  Created by Tran Tuyen on 1/19/19.
//  Copyright © 2019 ninjaKID. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    
    
    let cellIdentifier: String
    let numSections: Int
    var items: [ViewModel]
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIdentifier: String, numSections: Int, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> ()) {
        
        self.cellIdentifier = cellIdentifier
        self.numSections = numSections
        self.items = items
        self.configureCell = configureCell
        
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numSections
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Cell with identifier \(self.cellIdentifier) not found")
        }
        
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        return cell
        
    }
    
}
