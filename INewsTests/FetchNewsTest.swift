//
//  FetchNewsTest.swift
//  INewsTests
//
//  Created by no one on 17/07/2021.
//

import XCTest

@testable import INews
class FetchNewsTest: XCTestCase {
    var mockGetNewsAPIClient : MockGetNewsAPIClient?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func setUp() {
        mockGetNewsAPIClient = MockGetNewsAPIClient()
        
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testFetchRecipes()  {
        let expect = expectation(description: "")
        mockGetNewsAPIClient?.getNewsWith(page: 1){result in
            expect.fulfill()
            switch result {
            case.success(let news):
                XCTAssertEqual(news?.data?.count, 20)
            case .failure(_):
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 6.0, handler: nil)
        
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
