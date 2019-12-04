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
        
        controller.performSearch(for: "Tweetbot", resultType: .software) {
            XCTAssert(!controller.searchResults.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

}
