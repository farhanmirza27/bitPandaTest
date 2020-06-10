//
//  Fiat.swift
//  Demo
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

struct Fiat : Codable {
    var type : String
    var attributes : FiatAttribute
}

struct FiatAttribute : Codable {
    var symbol : String
    var name : String
    var avg_price : String?
    var logo : String
    var precision : Int
    var has_wallets : Bool
}
