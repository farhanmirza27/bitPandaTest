//
//  AssetsRouter.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class AssetsRouter : PresenterToRouterAssetsProtocol {
    static func createModule() -> AssetsViewController {
        let view = AssetsViewController()
        let presenter : ViewToPresenterAssetsProtocol & InteractorToPresenterAssetsProtocol = AssetsPresenter()
        let interactor : PresenterToInteractorAssetsProtocol = AssetsInteractor()
        let router : PresenterToRouterAssetsProtocol = AssetsRouter()
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
