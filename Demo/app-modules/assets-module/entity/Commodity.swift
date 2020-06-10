//
//  Commodity.swift
//  Demo
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


struct Commodity : Codable, AssetProtocol {
    var type : String
    var attributes : AssetAttribute
    
    func precisedPrice() -> String {
        guard let price = attributes.avg_price else {return ""}
        return Utils.shared.amountInLocalCurrency(Double(price)!,precision : attributes.precision_for_fiat_price)
    }
}
