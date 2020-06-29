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
    }
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    @IBOutlet weak var amountToConvertTextField: UITextField!
    
    
    @IBOutlet weak var convertedAmountTextField: UITextField!
    
//    let currencyController = CurrencyController()
//
//    let currency = Currency()
    
    let newRates: [String: Double] = ["AED": 4.120387,
                                      "AFN": 86.365658,
                                      "ALL": 124.36255,
                                      "AMD": 539.895937,
                                      "ANG": 2.012165,
                                      "AOA": 656.118679,
                                      "ARS": 78.689636,
                                      "AUD": 1.629754,
                                      "AWG": 2.019138,
                                      "AZN": 1.90206,
                                      "BAM": 1.956202,
                                      "BBD": 2.26341,
                                      "BDT": 95.090387,
                                      "BGN": 1.95688,
                                      "BHD": 0.423513,
                                      "BIF": 2157.131006,
                                      "BMD": 1.121743,
                                      "BND": 1.560783,
                                      "BOB": 7.740672,
                                      "BRL": 6.013108,
                                      "BSD": 1.121003,
                                      "BTC": 0.000122,
                                      "BTN": 84.732411,
                                      "BWP": 13.258604,
                                      "BYN": 2.673085,
                                      "BYR": 21986.170019,
                                      "BZD": 2.25961,
                                      "CAD": 1.530176,
                                      "CDF": 2126.825461,
                                      "CHF": 1.063912,
                                      "CLF": 0.032892,
                                      "CLP": 907.603758,
                                      "CNY": 7.940153,
                                      "COP": 4186.346251,
                                      "CRC": 649.067668,
                                      "CUC": 1.121743,
                                      "CUP": 29.726199,
                                      "CVE": 110.285983,
                                      "CZK": 26.69917,
                                      "DJF": 199.566177,
                                      "DKK": 7.454209,
                                      "DOP": 65.25383,
                                      "DZD": 144.970063,
                                      "EGP": 18.142216,
                                      "ERN": 16.826398,
                                      "ETB": 38.519683,
                                      "EUR": 1,
                                      "FJD": 2.440745,
                                      "FKP": 0.903162,
                                      "GBP": 0.903149,
                                      "GEL": 3.438124,
                                      "GGP": 0.903162,
                                      "GHS": 6.493535,
                                      "GIP": 0.903162,
                                      "GMD": 57.937827,
                                      "GNF": 10804.258629,
                                      "GTQ": 8.629041,
                                      "GYD": 234.19454,
                                      "HKD": 8.694128,
                                      "HNL": 27.752031,
                                      "HRK": 7.564988,
                                      "HTG": 121.671061,
                                      "HUF": 354.280448,
                                      "IDR": 16021.299658,
                                      "ILS": 3.856408,
                                      "IMP": 0.903162,
                                      "INR": 84.756124,
                                      "IQD": 1338.272593,
                                      "IRR": 47231.004232,
                                      "ISK": 155.406205,
                                      "JEP": 0.903162,
                                      "JMD": 156.436356,
                                      "JOD": 0.795286,
                                      "JPY": 120.201512,
                                      "KES": 119.351109,
                                      "KGS": 84.26794,
                                      "KHR": 4593.932827,
                                      "KMF": 491.968573,
                                      "KPW": 1009.630331,
                                      "KRW": 1344.700978,
                                      "KWD": 0.34534,
                                      "KYD": 0.934169,
                                      "KZT": 453.232163,
                                      "LAK": 10122.734404,
                                      "LBP": 1695.207296,
                                      "LKR": 208.899866,
                                      "LRD": 223.560152,
                                      "LSL": 19.271904,
                                      "LTL": 3.312217,
                                      "LVL": 0.678531,
                                      "LYD": 1.565784,
                                      "MAD": 10.875769,
                                      "MDL": 19.376612,
                                      "MGA": 4341.107012,
                                      "MKD": 61.686733,
                                      "MMK": 1552.036048,
                                      "MNT": 3164.659203,
                                      "MOP": 8.948702,
                                      "MRO": 400.46277,
                                      "MUR": 45.154902,
                                      "MVR": 17.297237,
                                      "MWK": 826.395744,
                                      "MXN": 25.460544,
                                      "MYR": 4.799918,
                                      "MZN": 78.533792,
                                      "NAD": 19.271504,
                                      "NGN": 434.485361,
                                      "NIO": 38.89305,
                                      "NOK": 10.834128,
                                      "NPR": 135.570572,
                                      "NZD": 1.743509,
                                      "OMR": 0.431841,
                                      "PAB": 1.121013,
                                      "PEN": 3.934748,
                                      "PGK": 3.882304,
                                      "PHP": 55.955975,
                                      "PKR": 187.600708,
                                      "PLN": 4.454364,
                                      "PYG": 7549.967772,
                                      "QAR": 4.084225,
                                      "RON": 4.8401,
                                      "RSD": 117.52498,
                                      "RUB": 77.569899,
                                      "RWF": 1070.834055,
                                      "SAR": 4.208319,
                                      "SBD": 9.351919,
                                      "SCR": 19.743299,
                                      "SDG": 62.029676,
                                      "SEK": 10.464626,
                                      "SGD": 1.560844,
                                      "SHP": 0.903162,
                                      "SLL": 10942.606981,
                                      "SOS": 651.733191,
                                      "SRD": 8.36599,
                                      "STD": 24734.829994,
                                      "SVC": 9.808778,
                                      "SYP": 575.749879,
                                      "SZL": 19.575049,
                                      "THB": 34.647848,
                                      "TJS": 11.546496,
                                      "TMT": 3.926102,
                                      "TND": 3.20202,
                                      "TOP": 2.565536,
                                      "TRY": 7.689024,
                                      "TTD": 7.579873,
                                      "TWD": 33.088847,
                                      "TZS": 2600.200871,
                                      "UAH": 29.933726,
                                      "UGX": 4192.597393,
                                      "USD": 1,
                                      "UYU": 47.278571,
                                      "UZS": 11410.840231,
                                      "VEF": 11.203414,
                                      "VND": 26017.716807,
                                      "VUV": 131.04987,
                                      "WST": 2.998838,
                                      "XAF": 656.075939,
                                      "XAG": 0.063218,
                                      "XAU": 0.000637,
                                      "XCD": 3.031568,
                                      "XDR": 0.810347,
                                      "XOF": 656.075939,
                                      "XPF": 119.634126,
                                      "YER": 280.773925,
                                      "ZAR": 19.231838,
                                      "ZMK": 10097.029829,
                                      "ZMW": 20.371141,
                                      "ZWL": 361.201366]
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newRates.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Array(newRates.keys)[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let currency1 = Array(newRates.values)[row]
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



//    extension ConverterViewController: CurrencyControllerDelegate {
//        func fetchRates() {
//        }
//}



