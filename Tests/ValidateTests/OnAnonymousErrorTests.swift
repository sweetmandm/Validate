//
//  OnAnonymousErrorTests.swift
//  Validate
//
//  Created by sweetman on 4/30/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import XCTest
@testable import Validate

class OnAnonymousErrorTests: XCTestCase {
    
    var subject: OnAnonymousError!
    
    override func setUp() {
        subject = OnAnonymousError()
    }
        
    func testReason() {
        XCTAssertTrue(
            subject.reason == "Error"
        )
    }
}
