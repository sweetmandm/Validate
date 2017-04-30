//
//  ValidateTests.swift
//  ValidateTests
//
//  Created by sweetman on 4/27/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import XCTest
@testable import Validate

class InvalidResultTests: XCTestCase {
    
    var subject: ValidationResult<Int, OnAnonymousError>! {
        return .invalid(OnAnonymousError())
    }
    
    func testHasErrors() {
        XCTAssertTrue(
            subject.errors.count == 1
        )
    }
    
    func testErrorType() {
        XCTAssertTrue(
            subject.errors.first is OnAnonymousError
        )
    }
    
    func testReportsValidity() {
        XCTAssertFalse(
            subject.isValid
        )
        
        XCTAssertTrue(
            subject.isInvalid
        )
    }
    
    func testValueIsNil() {
        XCTAssertNil(
            subject.value
        )
    }
}
