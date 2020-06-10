//
//  WalletResponse.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


struct WalletsResponse : Codable {
    var wallets : [Wallet]
    var commodityWallets : [CommodityWallet]
    var fiatWallets : [FiatWallet]
}
