//
//  ValidationResult.swift
//  ValidateThis
//
//  Created by sweetman on 4/27/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

// ValidateThis
// minimal, unopinionated, composable validations

public enum ValidationResult<Value> {
    case valid(Value)
    case invalid(ValidationError)
    
    public var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .invalid:
            return false
        }
    }
    
    public var isInvalid: Bool {
        return !isValid
    }
    
    public var errors: [ValidationError] {
        switch self {
        case .valid:
            return []
        case .invalid(let error):
            switch error {
            case (let error as OnMultiple): return error.errors
            default: return [error]
            }
        }
    }
}
