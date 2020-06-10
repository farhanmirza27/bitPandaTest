//
//  WalletsProtocols.swift
//  Demo
//
//  Created by Farhan Mirza on 06/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

// View to Presenter
protocol ViewToPresenterWalletsProtocol : class {
    var view : PresenterToViewWalletsProtocol? {get set}
    var interactor : PresenterToInteractorWalletsProtocol? {get set}
    var router : PresenterToRouterWalletsProtocol? {get set}
    func getWallets()
}

// Presenter to View
protocol PresenterToViewWalletsProtocol : class {
    func sucess(wallets : WalletsResponse)
    func fail(errorMessage : String)
}

// Presenter to Interactor
protocol PresenterToInteractorWalletsProtocol : class {
    var presenter : InteractorToPresenterWalletsProtocol?  {get set}
    var apiClient : APIClientProtocol? {get set}
    func getWallets()
}

// Interactor to Presenter
protocol InteractorToPresenterWalletsProtocol : class {
    func sucess(walllets : WalletsResponse)
    func fail(errorMessage : String)
}

// Presenter to Router
protocol PresenterToRouterWalletsProtocol : class {
    static func createModule() -> WalletsViewController
}


