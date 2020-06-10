//
//  WalletsInteractorTest.swift
//  DemoTests
//
//  Created by Farhan Mirza on 10/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Demo

class WalletsInteractorTest: XCTestCase {
    
    var sut : WalletsInteractor?
    var mockedPresenter : MockedPresenter?
    var mockedAPI : MockedAPI?
    
    override func setUp() {
        sut = WalletsInteractor()
        mockedPresenter = MockedPresenter()
        mockedAPI = MockedAPI()
        
        sut?.presenter = mockedPresenter
        sut?.apiClient = mockedAPI
    }
    
    override func tearDown() {
        sut = nil
        mockedAPI = nil
        mockedPresenter = nil
    }
    
    func testWalletsDataLoadSucess() {
          mockedAPI?.dataReturnedFromAPI = true
          sut?.getWallets()
          XCTAssertTrue(mockedPresenter!.dataReturnedToPresenter)
      }
      
      func testWalletsDataLoadFail() {
          mockedAPI?.dataReturnedFromAPI = false
          sut?.getWallets()
          XCTAssertFalse(mockedPresenter!.dataReturnedToPresenter)
      }
    
    class MockedPresenter : InteractorToPresenterWalletsProtocol {
        var dataReturnedToPresenter = false
        func sucess(walllets: WalletsResponse) {
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
