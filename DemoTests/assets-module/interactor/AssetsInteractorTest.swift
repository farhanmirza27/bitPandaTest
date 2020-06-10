//
//  AssetsInteractorTest.swift
//  DemoTests
//
//  Created by Farhan Mirza on 10/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Demo

class AssetsInteractorTest: XCTestCase {
    
    var sut : AssetsInteractor?
    var mockedPresenter : MockedPresenter?
    var mockedAPI : MockedAPI?
    
    override func setUp() {
        sut = AssetsInteractor()
        mockedPresenter = MockedPresenter()
        mockedAPI = MockedAPI()
        
        sut?.presenter = mockedPresenter
        sut?.apiClient = mockedAPI
        
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockedPresenter = nil
        mockedAPI = nil
    }
    
    func testAssetsDataLoadSucess() {
        mockedAPI?.dataReturnedFromAPI = true
        sut?.getAssets()
        XCTAssertTrue(mockedPresenter!.dataReturnedToPresenter)
    }
    
    func testAssetsDataLoadFail() {
        mockedAPI?.dataReturnedFromAPI = false
        sut?.getAssets()
        XCTAssertFalse(mockedPresenter!.dataReturnedToPresenter)
    }
    
    
    
    class MockedPresenter : InteractorToPresenterAssetsProtocol {
        var dataReturnedToPresenter = false
        func success(assets: AssetsResponse) {
            dataReturnedToPresenter = true
        }
        
        func fail(errorMessage: String) {
            dataReturnedToPresenter = false
        }
    }
    
    class MockedAPI : APIClientProtocol {
        var dataReturnedFromAPI = false
        func getData(completion: @escaping (Result<Response, Error>) -> Void) {
            if dataReturnedFromAPI {
                let mockedData = ResponseData(type: "", attributes: ResponseAttribute(cryptocoins: [], commodities: [], fiats: [], wallets: [], commodity_wallets: [], fiatwallets:   []))
                let mockedResponse = Response(data: mockedData)
                completion(.success(mockedResponse))
            }
            else {
                completion(.failure(NSError(domain: "JSON Failure", code: 0, userInfo: nil)))
            }
        }
    }
}
