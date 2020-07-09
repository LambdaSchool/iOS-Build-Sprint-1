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
        currencyController.saveToPersistentStore()
        currencyController.loadFromPersistentStore()
        currencyController.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    @IBOutlet weak var amountToConvertTextField: UITextField!
    
    
    @IBOutlet weak var convertedAmountTextField: UITextField!
    
    @IBOutlet weak var currencyDisplay: UILabel!
    
    let currencyController = CurrencyController()
    
    var newRates: [String: Double] = [:]
    
    let currencyNames = ["CAD, Canadian Dollar",
                         "HKD, Hong Kong Dollar",
                         "ISK, Icelandic Króna",
                         "PHP, Philippine peso",
                         "DKK, Danish Krone",
                         "HUF, Hungarian Forint",
                         "CZK, Czech Koruna",
                         "GBP, Pound sterling",
                         "RON, Romanian Leu",
                         "SEK, Swedish Krona",
                         "IDR, Indonesian Rupiah",
                         "INR, Indian Rupee",
                         "BRL, Brazilian Real",
                         "RUB, Russian Ruble",
                         "HRK, Croatian Kuna",
                         "JPY, Japanese Yen",
                         "THB, Thailand Baht",
                         "CHF, Swiss Franc",
                         "EUR, Euro",
                         "MYR, Malaysian Ringgit",
                         "BGN, Bulgarian Lev",
                         "TRY, Turkish lira",
                         "CNY, Chinese Yuan",
                         "NOK, Norwegian Krone",
                         "NZD, New Zealand Dollar",
                         "ZAR, South African Rand",
                         "USD, United States Dollar",
                         "MXN, Mexican Peso",
                         "SGD, Singapore Dollar",
                         "AUD, Australian Dollar",
                         "ILS, Israeli New Shekel",
                         "KRW, South Korean Won",
                         "PLN, Poland złoty"]
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyNames.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(currencyNames.sorted()[row])"
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let currencyKey = Array(newRates.keys.sorted())[row]
        guard let currency1 = newRates[currencyKey] else { return }
        guard let currency2 = NumberFormatter().number(from: amountToConvertTextField.text!)?.doubleValue else { return }
        
        
        func conversion() {
            let result = currency1 * currency2
            convertedAmountTextField.text = "\(formatter.string(for: result)!)"
            currencyDisplay.text = "\(newRates.keys.sorted()[row]) \(newRates[currencyKey]!)"
            
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


