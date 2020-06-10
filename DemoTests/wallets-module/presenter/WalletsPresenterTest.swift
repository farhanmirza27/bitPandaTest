//
//  WalletsPresenterTest.swift
//  DemoTests
//
//  Created by Farhan Mirza on 10/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Demo

class WalletsPresenterTest: XCTestCase {
    
    var sut : WalletsPresenter?
    var mockedView : MockedView?
    var mockedInteractor : MockedInteractor?

    override func setUp() {
       sut = WalletsPresenter()
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
    
    
    func testWalletsDisplayedSuccess() {
        mockedInteractor?.dataLoadedFromJSONFile = true
        sut?.getWallets()
        XCTAssertTrue(mockedView!.dataDisplayed)
    }
    
    
    func testWalletsDisplayedFailure() {
        mockedInteractor?.dataLoadedFromJSONFile = false
        sut?.getWallets()
        XCTAssertFalse(mockedView!.dataDisplayed)
    }

    
    class MockedView : PresenterToViewWalletsProtocol {
        var dataDisplayed = false
        func sucess(wallets: WalletsResponse) {
            dataDisplayed = true
        }
        
        func fail(errorMessage: String) {
            dataDisplayed = false
        }
    }
    
    class MockedInteractor : PresenterToInteractorWalletsProtocol {
        var dataLoadedFromJSONFile = false
        var presenter: InteractorToPresenterWalletsProtocol?
        var apiClient: APIClientProtocol?
        
        func getWallets() {
            if dataLoadedFromJSONFile {
                let walletResponse = WalletsResponse(wallets: [], commodityWallets: [], fiatWallets: [])
                presenter?.sucess(walllets: walletResponse)
            }
            else {
                presenter?.fail(errorMessage: "Failed To Load Data")
            }
        }
    }
}
