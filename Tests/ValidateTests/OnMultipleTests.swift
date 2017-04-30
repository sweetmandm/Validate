//
//  OnMultipleTests.swift
//  Validate
//
//  Created by sweetman on 4/30/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

import XCTest
@testable import Validate

class OnMultipleTests: XCTestCase {
    
    var subject: OnMultiple!
    let field = FieldObject()
    let errors: [ValidationError] = [
        OnReason("First reason."), OnAnonymousError(), OnReason("Third reason.")
    ]
    
    override func setUp() {
        subject = OnMultiple(errors)
    }
    
    func testReason() {
        XCTAssertTrue(
            subject.reason == "First reason.\nError\nThird reason."
        )
    }
}
