//
//  CurrencyController.swift
//  CunnecryConverterBuildSprint1
//
//  Created by Dojo on 6/16/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit


protocol CurrencyControllerDelegate {
    func didfetchRates()
}

class CurrencyController {
    
    var delegate: CurrencyControllerDelegate?

    var newRates: [String: Double] = [:] {
        didSet { delegate?.didfetchRates()
            print(newRates)
        }
    }
    
    func fetchRates() {
        
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching currency rates: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned when fetching currency rates.")
                return
            }
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            do {
                let currency = try JSONDecoder().decode(Currency.self, from: data)
                DispatchQueue.main.async {
                    self.newRates = currency.rates
                }
                
            } catch {
                print("Error decoding rates; \(error)")
            }
            
        }.resume()
        
        
    }
}



