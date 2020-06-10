//
//  Cryptocoin.swift
//  Demo
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


protocol AssetProtocol {
    func precisedPrice() -> String
}

struct Cryptocoin : Codable, AssetProtocol {
    var type : String
    var attributes : AssetAttribute
    
    func precisedPrice() -> String {
        guard let price = attributes.avg_price else {return ""}
        return Utils.shared.amountInLocalCurrency(Double(price)!,precision : attributes.precision_for_fiat_price)
       }
}

struct AssetAttribute : Codable {
    var symbol : String
    var name : String
    var avg_price : String?
    var logo : String
    var precision_for_fiat_price : Int
}
