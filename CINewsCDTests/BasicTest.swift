//
//  BasicTest.swift
//  CINewsCDTests
//
//  Created by Avinash on 09/01/26.
//

import XCTest

final class BasicTest: XCTestCase {

    func testAlwaysPass() {
        XCTAssertTrue(true)
    }

    func testMathAddition() {
        let sum = 2 + 2
        XCTAssertEqual(sum, 4)
    }
}

