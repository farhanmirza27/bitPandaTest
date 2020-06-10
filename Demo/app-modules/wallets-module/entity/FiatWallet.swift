//
//  FiatWallet.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


struct FiatWallet : Codable , WalletProtocol{
    var type : String
    var attributes : FiatWalletAttribute
   
    func getBalance() -> Double {
        return Double(attributes.balance)!
    }
    
    func precisedBalance() -> String {
        return Utils.shared.amountInLocalCurrency(getBalance())
      }
}

struct FiatWalletAttribute : Codable {
    var name : String
     var fiat_symbol : String
     var balance :  String
     var is_default : Bool?
     var deleted : Bool?
}
