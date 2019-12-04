//
//  iTunes_SearchTests.swift
//  iTunes SearchTests
//
//  Created by John Kouris on 12/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class iTunes_SearchTests: XCTestCase {

    func testPerformSearch() {
        let controller = SearchResultController()
        
        let expectation = self.expectation(description: "Waiting for iTunes API to return valid results")
        
        // Load the file and send it back via completion.
        let bundle = Bundle(for: NetworkMockDownloader.self)
        let path = bundle.path(forResource: "iTunes_api_real_results", ofType: "js")!
        let fileData = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        let mockNetworkDownloader = NetworkMockDownloader()
        mockNetworkDownloader.data = fileData
        
        controller.performSearch(baseURL: controller.baseURL, for: "Tweetbot", resultType: .software, networkDownloader: mockNetworkDownloader) {
            XCTAssert(!controller.searchResults.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testMockSearch() {
//        let controller = SearchResultController()
        
//        controller.performSearch(for: <#T##String#>, resultType: <#T##ResultType#>, completion: <#T##() -> Void#>)
    }

}
