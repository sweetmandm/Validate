//
//  ValidResultTests.swift
//  Validate
//
//  Created by sweetman on 4/29/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import XCTest
@testable import Validate

class ValidResultTests: XCTestCase {
    
    var subject: ValidationResult<Int, OnAnonymousError>! {
        return .valid(10)
    }
    
    func testHasNoErrors() {
        XCTAssertTrue(
            subject.errors.count == 0
        )
    }
    
    func testValue() {
        XCTAssertTrue(
            subject.value == 10
        )
    }
    
    func testReportsValidity() {
        XCTAssertTrue(
            subject.isValid
        )
        
        XCTAssertFalse(
            subject.isInvalid
        )
    }
}
