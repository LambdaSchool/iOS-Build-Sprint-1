//
//  CurrencyController.swift
//  CunnecryConverterBuildSprint1
//
//  Created by Dojo on 6/16/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit

class CurrencyController {

    var rates: [String: Double] = [:]
    
    func fetchRates() {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=3d89b4dea4fd6268fa9743bb9381778d")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching currency rates: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned when fetching currency rates.")
                return
            }
            
            do {
                let currency = try JSONDecoder().decode(Currency.self, from: data)
                DispatchQueue.main.async {
                    self.rates = currency.rates
                }
                
            } catch {
                print("Error decoding rates; \(error)")
            }
            
        }.resume()
        
    }
}
