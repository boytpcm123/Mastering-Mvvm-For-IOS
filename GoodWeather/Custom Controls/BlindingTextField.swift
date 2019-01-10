//
//  BlindingTextField.swift
//  GoodWeather
//
//  Created by hungdat1234 on 1/10/19.
//  Copyright © 2019 ninjaKID. All rights reserved.
//

import UIKit

class BlindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func bind(callBack: @escaping (String) -> ()) {
        self.textChangeClosure = callBack
    }
    
    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            self.textChangeClosure(text)
        }
        
    }

}
