//
//  ValidationResult.swift
//  Validate
//
//  Created by sweetman on 4/27/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

/*
 
 Validate
 --------
 minimal, unopinionated, composable validations
 BYOBusiness Logic
 
 */

public enum ValidationResult<Value, ErrorType: ValidationError> {
    case valid(Value)
    case invalid(ErrorType)
    
    public var isValid: Bool {
        switch self {
        case .valid: return true
        case .invalid: return false
        }
    }
    
    public var isInvalid: Bool {
        return !isValid
    }
    
    public var value: Value? {
        switch self {
        case .valid(let value): return value
        case .invalid: return nil
        }
    }
    
    public var errors: [ValidationError] {
        switch self {
        case .valid:
            return []
        case .invalid(let error):
            switch error {
            case (let multiple as OnMultiple): return multiple.errors
            default: return [error]
            }
        }
    }
}
