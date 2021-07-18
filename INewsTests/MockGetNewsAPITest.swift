//
//  MockGetNewsAPITest.swift
//  INewsTests
//
//  Created by no one on 17/07/2021.
//

import XCTest
@testable import INews
class MockGetNewsAPIClient:NewsAPIProtocol {
    func getNewsWith(page: Int, completion: @escaping (Result<BaseResponse<[NewsModel]>?, NSError>) -> Void) {
        let bundle = Bundle(for: type(of: self))
               guard let fileUrl = bundle.url(forResource: "news", withExtension: "json") else{
                   print("missing file news")
                   XCTFail()
                   return
               }
               print(fileUrl)
               let json = try! Data(contentsOf: fileUrl)
               print(json)
        guard let responseObj = try? JSONDecoder().decode(BaseResponse<[NewsModel]>.self, from: json) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
            completion(.failure(error))
            return
        }
        completion(.success(responseObj))
    }
    

    

}
