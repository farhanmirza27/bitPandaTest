//
//  AssetsPresenterTest.swift
//  DemoTests
//
//  Created by Farhan Mirza on 10/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Demo

class AssetsPresenterTest: XCTestCase {
    
    var sut : AssetsPresenter?
    var mockedView : MockedView?
    var mockedInteractor : MockedInteractor?

    override func setUp() {
        sut = AssetsPresenter()
        mockedView = MockedView()
        mockedInteractor = MockedInteractor()
        
        mockedInteractor?.presenter = sut
        sut?.view = mockedView
        sut?.interactor = mockedInteractor
        
    }

    override func tearDown() {
       sut = nil
       mockedView = nil
       mockedInteractor = nil
    }
    
    
    func testAssetDisplaySucess() {
        mockedInteractor?.dataLoadedFromJSONFile = true
        sut?.getAssets()
        XCTAssertTrue(mockedView!.assetsDisplayed)
    }
    
    func testAssetDisplayFailure() {
           mockedInteractor?.dataLoadedFromJSONFile = false
           sut?.getAssets()
           XCTAssertFalse(mockedView!.assetsDisplayed)
       }

    class MockedView : PresenterToViewAssetsProtocol {
        var assetsDisplayed = false
        func showAssets(assets: AssetsResponse) {
         assetsDisplayed = true
        }
        
        func error(errorMessage: String) {
          assetsDisplayed = false
        }
    
    }
    
    class MockedInteractor : PresenterToInteractorAssetsProtocol {
        var dataLoadedFromJSONFile = false
        var presenter: InteractorToPresenterAssetsProtocol?
        
        var apiClient: APIClientProtocol?
        
        func getAssets() {
            if dataLoadedFromJSONFile {
                let assetsResponse = AssetsResponse(cryptocoins: [], commodities: [], fiats: [])
                presenter?.success(assets: assetsResponse)
            }
            else {
                presenter?.fail(errorMessage: "Failed to load data from JSON")
            }
        }
        
        
    }
}
