//
//  APIServiceTest.swift
//  DataSetAppTests
//
//  Created by Anand, Chetan [GCB-OT NE] on 17/12/18.
//  Copyright © 2018 SPHTech. All rights reserved.
//

import XCTest
@testable import DataSetApp

class APIServiceTest: XCTestCase {
    
    var sut: MobileDataListViewModel!
    
    
    override func setUp() {
        super.setUp()
        sut = MobileDataListViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchStarted() {
        // When
        sut.start()

        // Assert
        XCTAssert(sut.isLoading.value)
    }


}
