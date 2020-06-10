//
//  AssetsPresenter.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class AssetsPresenter : ViewToPresenterAssetsProtocol {
    var view: PresenterToViewAssetsProtocol?
    var interactor: PresenterToInteractorAssetsProtocol?
    var router: PresenterToRouterAssetsProtocol?
    
    func getAssets() {
        interactor?.getAssets()
    }
}

extension AssetsPresenter : InteractorToPresenterAssetsProtocol {
    func success(assets : AssetsResponse) {
        view?.showAssets(assets: assets)
    }
    func fail(errorMessage: String) {
        view?.error(errorMessage: errorMessage)
    }
}
