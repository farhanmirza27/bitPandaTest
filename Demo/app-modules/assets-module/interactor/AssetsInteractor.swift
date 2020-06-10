//
//  AssetsInteractor.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class AssetsInteractor : PresenterToInteractorAssetsProtocol {
    var apiClient: APIClientProtocol?
    var presenter: InteractorToPresenterAssetsProtocol?
    
    func getAssets() {
        // handle success & failure
        apiClient?.getData(completion: { result in
            switch result {
            case .success(let response):
                var assets = AssetsResponse(cryptocoins: [], commodities: [], fiats: [])
                assets.cryptocoins = response.data.attributes.cryptocoins
                assets.commodities = response.data.attributes.commodities
                assets.fiats = response.data.attributes.fiats.filter {$0.attributes.has_wallets}
                self.presenter?.success(assets: assets)
            case .failure(let error):
                self.presenter?.fail(errorMessage: error.localizedDescription)
            }
        })
    }
}
