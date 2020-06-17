//
//  ConverterViewController.swift
//  CunnecryConverterBuildSprint1
//
//  Created by Dojo on 6/16/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func currencyTypeWasChosen(_ date: Date)
}

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var currencyPicker1: UIPickerView!
    @IBOutlet weak var currencyPicker2: UIPickerView!
    
    @IBOutlet weak var amountToConvertTextField: UITextField!
    @IBOutlet weak var convertedAmountTextView: UILabel!
    
    
    @IBOutlet weak var exhchangeRateTextDisplay: UITextView!
    
    let currencies = ["USD", "MXN", "CAD", "YIN"]
}

extension ConverterViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencies.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {        
        return currencies[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        <#code#>
//    }
    
}
    extension ConverterViewController: UIPickerViewDelegate {

}

