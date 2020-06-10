//
//  WalletsInteractor.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class WalletsInteractor: PresenterToInteractorWalletsProtocol {
    var presenter: InteractorToPresenterWalletsProtocol?
    var apiClient: APIClientProtocol?
    
    func getWallets() {
        apiClient?.getData(completion: { result in
            switch result {
            case .success(let response):
                var wallets = WalletsResponse(wallets: [], commodityWallets: [], fiatWallets: [])
                wallets.wallets = response.data.attributes.wallets.filter { !$0.attributes.deleted}.sorted {
                    $0.getBalance() > $1.getBalance()
                }
                wallets.commodityWallets = response.data.attributes.commodity_wallets.filter { !$0.attributes.deleted}.sorted {
                    $0.getBalance() > $1.getBalance()
                }
                wallets.fiatWallets = response.data.attributes.fiatwallets.sorted {
                    $0.getBalance() > $1.getBalance()
                }
                self.presenter?.sucess(walllets: wallets)
            case .failure(let error):
                self.presenter?.fail(errorMessage: error.localizedDescription)
            }
        })
    }
    
}
