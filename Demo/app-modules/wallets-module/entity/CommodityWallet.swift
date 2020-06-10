//
//  CommodityWallet.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

struct CommodityWallet : Codable , WalletProtocol {
    var type : String
    var attributes : WalletAttribute
    
    func getBalance() -> Double {
        return Double(attributes.balance)!
    }
    
    func precisedBalance() -> String {
        return Utils.shared.amountInLocalCurrency(getBalance())
    }
}
