//
//  Response.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

struct  Response : Codable {
    var data  : ResponseData
}

// data
struct ResponseData : Codable {
    var type : String
    var attributes : ResponseAttribute
}

// attribute
struct ResponseAttribute : Codable {
    var cryptocoins : [Cryptocoin]
    var commodities : [Commodity]
    var fiats : [Fiat]
    var wallets : [Wallet]
    var commodity_wallets : [CommodityWallet]
    var fiatwallets : [FiatWallet]
}
