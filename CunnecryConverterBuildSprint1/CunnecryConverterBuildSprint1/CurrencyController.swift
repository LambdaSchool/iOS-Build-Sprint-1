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
    
    private var persistantFileURL: URL? {
        
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        return dir.appendingPathComponent("rates.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistantFileURL else { return }
        
        do {
            
            let encoder = JSONEncoder()
            let data = try encoder.encode(newRates)
            try data.write(to: url)
            
        } catch {
            print("Was not able to encode data")
            NSLog("Was not able to encode data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fm = FileManager.default
        
        guard let url = persistantFileURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let currency = try decoder.decode(Currency.self, from: data)
                self.newRates = currency.rates
            
        } catch {
            
            print("No data was saved")
            
        }
    }
}


