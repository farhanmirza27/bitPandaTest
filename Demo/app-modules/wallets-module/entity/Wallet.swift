//
//  Wallet.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

protocol WalletProtocol {
    func getBalance() -> Double
    func precisedBalance() -> String
}

struct Wallet : Codable, WalletProtocol {
    var type : String
    var attributes : WalletAttribute
   
    func getBalance() -> Double {
        return  Double(attributes.balance)!
      }
    
    func precisedBalance() -> String {
        return Utils.shared.amountInLocalCurrency(getBalance())
    }
}

struct WalletAttribute : Codable {
    var name : String
    var cryptocoin_symbol : String
    var balance :  String
    var is_default : Bool
    var deleted : Bool
}
