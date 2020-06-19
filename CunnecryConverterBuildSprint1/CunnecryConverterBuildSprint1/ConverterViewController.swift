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
    
    var rates: [String: Double] = ["AED": 4.118812,
                                   "AFN": 88.147468,
                                   "ALL": 124.479404,
                                   "AMD": 538.152867,
                                   "ANG": 2.011935,
                                   "AOA": 674.711309,
                                   "ARS": 78.128771,
                                   "AUD": 1.634094,
                                   "AWG": 2.018368,
                                   "AZN": 1.918944,
                                   "BAM": 1.950101,
                                   "BBD": 2.274499,
                                   "BDT": 95.208202,
                                   "BGN": 1.957133,
                                   "BHD": 0.423476,
                                   "BIF": 2137.82893,
                                   "BMD": 1.121316,
                                   "BND": 1.561327,
                                   "BOB": 7.739244,
                                   "BRL": 6.030662,
                                   "BSD": 1.12649,
                                   "BTC": 0.000121,
                                   "BTN": 85.347061,
                                   "BWP": 13.237117,
                                   "BYN": 2.681056,
                                   "BYR": 21977.784966,
                                   "BZD": 2.259362,
                                   "CAD": 1.524207,
                                   "CDF": 2085.647531,
                                   "CHF": 1.065872,
                                   "CLF": 0.033221,
                                   "CLP": 916.666556,
                                   "CNY": 7.946985,
                                   "COP": 4205.494006,
                                   "CRC": 646.722426,
                                   "CUC": 1.121316,
                                   "CUP": 29.714862,
                                   "CVE": 110.662408,
                                   "CZK": 26.682813,
                                   "DJF": 199.280521,
                                   "DKK": 7.45657,
                                   "DOP": 65.478254,
                                   "DZD": 144.927917,
                                   "EGP": 18.143332,
                                   "ERN": 16.819367,
                                   "ETB": 38.595909,
                                   "EUR": 1,
                                   "FJD": 2.443012,
                                   "FKP": 0.902062,
                                   "GBP": 0.901879,
                                   "GEL": 3.419811,
                                   "GGP": 0.902062,
                                   "GHS": 6.533701,
                                   "GIP": 0.902062,
                                   "GMD": 57.972489,
                                   "GNF": 10832.319834,
                                   "GTQ": 8.634683,
                                   "GYD": 234.405041,
                                   "HKD": 8.690459,
                                   "HNL": 28.010488,
                                   "HRK": 7.549705,
                                   "HTG": 121.240765,
                                   "HUF": 345.886631,
                                   "IDR": 15959.179766,
                                   "ILS": 3.867098,
                                   "IMP": 0.902062,
                                   "INR": 85.505905,
                                   "IQD": 1344.80003,
                                   "IRR": 47212.991842,
                                   "ISK": 153.406874,
                                   "JEP": 0.902062,
                                   "JMD": 157.943408,
                                   "JOD": 0.795026,
                                   "JPY": 119.889979,
                                   "KES": 119.20711,
                                   "KGS": 83.951999,
                                   "KHR": 4581.426707,
                                   "KMF": 491.977556,
                                   "KPW": 1009.253077,
                                   "KRW": 1358.586515,
                                   "KWD": 0.344973,
                                   "KYD": 0.938717,
                                   "KZT": 453.856565,
                                   "LAK": 10125.479811,
                                   "LBP": 1703.481963,
                                   "LKR": 209.095816,
                                   "LRD": 223.371045,
                                   "LSL": 19.61205,
                                   "LTL": 3.310953,
                                   "LVL": 0.678272,
                                   "LYD": 1.575885,
                                   "MAD": 10.867223,
                                   "MDL": 19.437411,
                                   "MGA": 4311.458284,
                                   "MKD": 61.44953,
                                   "MMK": 1570.327298,
                                   "MNT": 3161.79024,
                                   "MOP": 8.947731,
                                   "MRO": 400.310042,
                                   "MUR": 44.852854,
                                   "MVR": 17.267903,
                                   "MWK": 825.288766,
                                   "MXN": 25.473819,
                                   "MYR": 4.79643,
                                   "MZN": 78.323946,
                                   "NAD": 19.626057,
                                   "NGN": 434.505379,
                                   "NIO": 38.036431,
                                   "NOK": 10.678669,
                                   "NPR": 136.556926,
                                   "NZD": 1.745871,
                                   "OMR": 0.431705,
                                   "PAB": 1.1265,
                                   "PEN": 3.939845,
                                   "PGK": 3.862902,
                                   "PHP": 56.240144,
                                   "PKR": 186.603112,
                                   "PLN": 4.449325,
                                   "PYG": 7536.442605,
                                   "QAR": 4.082697,
                                   "RON": 4.841389,
                                   "RSD": 117.598007,
                                   "RUB": 78.355515,
                                   "RWF": 1068.05307,
                                   "SAR": 4.206678,
                                   "SBD": 9.348353,
                                   "SCR": 19.723664,
                                   "SDG": 61.951964,
                                   "SEK": 10.561206,
                                   "SGD": 1.562867,
                                   "SHP": 0.902062,
                                   "SLL": 10932.82687,
                                   "SOS": 653.727077,
                                   "SRD": 8.362795,
                                   "STD": 24725.396661,
                                   "SVC": 9.808183,
                                   "SYP": 575.26556,
                                   "SZL": 19.4559,
                                   "THB": 34.737799,
                                   "TJS": 11.553654,
                                   "TMT": 3.935818,
                                   "TND": 3.2064,
                                   "TOP": 2.544717,
                                   "TRY": 7.690099,
                                   "TTD": 7.611322,
                                   "TWD": 33.155021,
                                   "TZS": 2595.845682,
                                   "UAH": 30.130245,
                                   "UGX": 4175.332748,
                                   "USD": 1.121316,
                                   "UYU": 48.015988,
                                   "UZS": 11393.687186,
                                   "VEF": 11.199142,
                                   "VND": 26148.982414,
                                   "VUV": 131.076295,
                                   "WST": 3.004179,
                                   "XAF": 656.528186,
                                   "XAG": 0.064447,
                                   "XAU": 0.000649,
                                   "XCD": 3.030411,
                                   "XDR": 0.81641,
                                   "XOF": 656.53405,
                                   "XPF": 119.661061,
                                   "YER": 280.666612,
                                   "ZAR": 19.560215,
                                   "ZMK": 10093.185582,
                                   "ZMW": 20.363372,
                                   "ZWL": 361.063611]
    
}

extension ConverterViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rates.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Array(rates.keys)[row])"
        
    }
    
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        <#code#>
    //    }
    
}
extension ConverterViewController: UIPickerViewDelegate {
    
}

