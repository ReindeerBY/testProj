//
//  XCTestCase+Utils.swift
//  TestProjectTests
//
//  Created by Evgeniy on 17.11.22.
//

import XCTest

extension XCTestCase {

    func wait(for expectation: XCTestExpectation) {
        waitAndPrintTime(for: [expectation], timeout: .defaultExpectationTimeout)
    }

    private func waitAndPrintTime(for expectations: [XCTestExpectation], timeout seconds: TimeInterval) {
        let start = CFAbsoluteTimeGetCurrent()

        wait(for: expectations, timeout: seconds)

        let diff = CFAbsoluteTimeGetCurrent() - start
        print("Waiting took \(diff) seconds")
    }
}

extension TimeInterval {

    static let defaultExpectationTimeout: TimeInterval = 5.0
}
