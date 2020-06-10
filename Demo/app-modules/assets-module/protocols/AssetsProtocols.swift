//
//  AssetsProtocols.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

// View to presenter
protocol ViewToPresenterAssetsProtocol : class {
    var view : PresenterToViewAssetsProtocol? {get set}
    var interactor : PresenterToInteractorAssetsProtocol? {get set}
    var router : PresenterToRouterAssetsProtocol? {get set}
    // Get assets
    func getAssets()
}

// Presenter to view
protocol PresenterToViewAssetsProtocol : class {
    func showAssets(assets : AssetsResponse)
    func error(errorMessage : String)
}

// Presenter to interactor
protocol PresenterToInteractorAssetsProtocol : class {
    var presenter : InteractorToPresenterAssetsProtocol? {get set}
    var apiClient : APIClientProtocol? {get set}
    func getAssets()
}

// Interactor to presenter
protocol InteractorToPresenterAssetsProtocol : class {
    func success(assets : AssetsResponse)
    func fail(errorMessage : String)
}

// Presenter to router
protocol PresenterToRouterAssetsProtocol : class {
    static func createModule() -> AssetsViewController
}
