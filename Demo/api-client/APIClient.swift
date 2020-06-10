//
//  APIClient.swift
//  Demo
//
//  Created by Farhan Mirza on 05/06/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    func getData(completion : @escaping (Result<Response,Error>) -> Void)
}

class APIClient : APIClientProtocol {
    func getData(completion: @escaping (Result<Response, Error>) -> Void) {
        // read data from local json file
        guard let url = Bundle.main.url(forResource: "Masterdata", withExtension: "json") else {
            // invalid file name or file not found.
            completion(.failure(NSError(domain: "Data not found", code: 0, userInfo: nil)))
            return}
        do  {
            let data = try Data(contentsOf: url)
            // success
            let response = try JSONDecoder().decode(Response.self, from: data)
            completion(.success(response))
        }
        catch let error {
            // failure
            completion(.failure(error))
        }
    }
}

