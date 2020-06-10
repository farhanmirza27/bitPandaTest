//
//  AssetsResponse.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

struct AssetsResponse : Codable {
    var cryptocoins : [Cryptocoin]
    var commodities : [Commodity]
    var fiats : [Fiat]
}
