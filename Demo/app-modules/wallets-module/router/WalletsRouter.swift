//
//  WalletsRouter.swift
//  Demo
//
//  Created by Farhan Mirza on 07/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class WalletsRouter : PresenterToRouterWalletsProtocol {
    static func createModule() -> WalletsViewController {
        let view = WalletsViewController()
        let presenter : ViewToPresenterWalletsProtocol & InteractorToPresenterWalletsProtocol = WalletsPresenter()
        let interactor : PresenterToInteractorWalletsProtocol = WalletsInteractor()
        let router : PresenterToRouterWalletsProtocol = WalletsRouter()
        let apiClient : APIClientProtocol = APIClient()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.apiClient = apiClient
        
        return view
    }

}
