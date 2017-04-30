//
//  OnFieldTests.swift
//  Validate
//
//  Created by sweetman on 4/30/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import XCTest
@testable import Validate

class OnFieldTests: XCTestCase {
    
    var subject: OnField!
    let field = FieldObject()
    let reason = "There is a problem."
    
    override func setUp() {
        subject = OnField(reason: reason, field: field)
    }
    
    func testReason() {
        XCTAssertTrue(
            subject.reason == reason
        )
    }
    
    func testField() {
        XCTAssertTrue(
            subject.field as? FieldObject == field
        )
    }
    
    func testNeutralStyleApplication() {
        subject.applyNeutralStyle()
        XCTAssertTrue(
            field.called.count == 1
        )
        
        XCTAssertTrue(
            field.called.contains("applyNeutralStyle()")
        )
    }
    
    func testValidStyleApplication() {
        subject.applyValidStyle()
        XCTAssertTrue(
            field.called.count == 1
        )
        
        XCTAssertTrue(
            field.called.contains("applyValidStyle()")
        )
    }

    func testInvalidStyleApplication() {
        subject.applyInvalidStyle()
        XCTAssertTrue(
            field.called.count == 1
        )
        
        XCTAssertTrue(
            field.called.contains("applyInvalidStyle(error:)")
        )
        
        XCTAssertTrue(
            field.withError as? OnField === subject
        )
    }
}
