//
//  ConverterViewController.swift
//  CunnecryConverterBuildSprint1
//
//  Created by Dojo on 6/16/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyController.fetchRates()
        currencyController.delegate = self
    }
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    @IBOutlet weak var amountToConvertTextField: UITextField!
    
    
    @IBOutlet weak var convertedAmountTextField: UITextField!
    
    let currencyController = CurrencyController()
    
    let currency = Currency()
    
    var newRates: [String: Double] = [:]
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newRates.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Array(newRates.keys.sorted())[row])"
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let currencyKey = Array(newRates.keys.sorted())[row]
        guard let currency1 = newRates[currencyKey] else { return }
        guard let currency2 = NumberFormatter().number(from: amountToConvertTextField.text!)?.doubleValue else { return }
        
        func conversion() {
            let result = currency1 * currency2
            convertedAmountTextField.text = "\(result)"
        }
        conversion()
        print(currency1)
        print(currency2)
    }
}

extension ConverterViewController: CurrencyControllerDelegate {
    func didfetchRates() {
        newRates = currencyController.newRates
        currencyPicker.reloadAllComponents()
    }
    
    
}

