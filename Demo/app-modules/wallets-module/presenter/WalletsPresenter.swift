//
//  WalletsPresenter.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

class WalletsPresenter : ViewToPresenterWalletsProtocol {
    var view: PresenterToViewWalletsProtocol?
    var interactor: PresenterToInteractorWalletsProtocol?
    var router: PresenterToRouterWalletsProtocol?
    // get walllets
    func getWallets() {
        interactor?.getWallets()
    }
}

extension WalletsPresenter : InteractorToPresenterWalletsProtocol {
    func sucess(walllets: WalletsResponse) {
        view?.sucess(wallets: walllets)
    }
    
    func fail(errorMessage: String) {
        view?.fail(errorMessage: errorMessage)
    }
}
