//
//  Utils.swift
//  Demo
//
//  Created by Farhan Mirza on 08/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class Utils {
    // shared instance
    static let shared = Utils()
    // init
    private init() {
        // for singleton pattern
    }
    // device region based currency
    func amountInLocalCurrency(_ amount : Double, precision : Int = 2) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.maximumFractionDigits = precision
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
}
