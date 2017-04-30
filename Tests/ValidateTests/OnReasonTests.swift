//
//  OnReason.swift
//  Validate
//
//  Created by sweetman on 4/30/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import XCTest
@testable import Validate

class OnReasonTests: XCTestCase {
    var subject: OnReason!
    let reason = "The reason."
    
    override func setUp() {
        subject = OnReason(reason)
    }
    
    func testReason() {
        XCTAssertTrue(
            subject.reason == reason
        )
    }
}
