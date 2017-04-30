//
//  OnFieldMultipleTests.swift
//  Validate
//
//  Created by sweetman on 4/30/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import XCTest
@testable import Validate

class OnFieldMultipleTests: XCTestCase {
    
    var subject: OnFieldMultiple!
    let field = FieldObject()
    let errors = [OnReason("First reason."), OnReason(""), OnReason("Third reason.")]
    
    override func setUp() {
        subject = OnFieldMultiple(errors: errors, field: field)
    }
    
    func testReason() {
        XCTAssertTrue(
            subject.reason == "First reason.\nThird reason."
        )
    }
    
    func testErrorsType() {
        XCTAssertNotNil(
            subject.errors as? [OnReason]
        )
    }
    
    func testErrorsCount() {
        XCTAssertTrue(
            subject.errors.count == 3
        )
    }
    
    func testErrorsValues() {
        guard let errors = subject.errors as? [OnReason] else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(
            errors.elementsEqual(self.errors, by: { $0 === $1 })
        )
    }
}
